extends AnimatableBody2D
class_name UpdatedItem

@onready var player = get_tree().get_first_node_in_group("Guard1")
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $AnimatedSprite2D
@onready var sprite2d = $Sprite2D
@onready var panel = $Panel
@onready var label = $Label
@onready var inventory: Current_Inventory = preload("res://Inventory/player_inventory.tres")

var new_item = Inventory.new()  # Create a new inventory item

@export var item_manager_path: NodePath
var item_manager: Item_Manager
var item_present = true
var item_data = null

func _ready():
	panel.visible = false
	interaction_area.interact = Callable(self, "_on_interact")

	if item_manager_path:
		item_manager = get_node(item_manager_path)
	else:
		item_manager = get_tree().get_first_node_in_group("ItemManager")

	item_data = item_manager.get_item_at_position(
		panel.global_position.x, 
		panel.global_position.y
	)
	print(global_position)
	
	if item_data.size() > 0:
		# Set the appropriate texture
		if "texture_path" in item_data:
			var texture = load(item_data.texture_path)
			if texture and sprite:
				sprite2d.texture = texture
				sprite2d.visible = false
				print("item found")
	else:
		print("No item data found for position: ", global_position)

	
func _on_interact():
	await get_tree().create_timer(0.1).timeout
	print("Interaction triggered!")

	if item_data.size() > 0:
		add_item()

	if sprite.animation == "idle":
		sprite2d.visible = true
		label.global_position.x = player.global_position.x - 80
		label.global_position.y = player.global_position.y + 20
		label.text = item_data.name
		sprite.animation = "active"
		panel.global_position.x = player.position.x - 80
		panel.global_position.y = player.position.y - 40
		panel.visible = true
		while true:
			await get_tree().process_frame
			if Input.is_action_just_pressed("interact"):
				sprite.animation = "idle"
				panel.visible = false
				sprite2d.visible = false
				break


func add_item():
	if item_present and item_data.size() > 0:
		for i in range(inventory.items.size()):
			if inventory.items[i] == null:
				# Create inventory item from data
				var new_inventory_item = item_manager.create_inventory_item(item_data)
				
				# Add to inventory
				inventory.items[i] = new_inventory_item
				print("Added " + new_inventory_item.name + " at index: " + str(i))
				item_present = false
				break
