extends AnimatableBody2D

@onready var player = get_tree().get_first_node_in_group("Guard1")
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $AnimatedSprite2D
@onready var panel = $Panel
@onready var inventory: Current_Inventory = preload("res://Inventory/player_inventory.tres")


func _ready():
	panel.visible = false
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	await get_tree().create_timer(0.1).timeout

	print("Interaction triggered!")

	if sprite.animation == "idle":
		sprite.animation = "active"
		panel.global_position.x = player.position.x - 80
		panel.global_position.y = player.position.y - 40
		panel.visible = true
		while true:
			await get_tree().process_frame
			if Input.is_action_just_pressed("interact"):
				sprite.animation = "idle"
				panel.visible = false
				break
