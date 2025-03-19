extends AnimatableBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
#@onready var sprite = $Sprite2D2
#@onready var speech_sound = preload("res://Assets/sounds/coin.wav")
@onready var player = get_tree().get_first_node_in_group("Guard1")
@onready var item_location: Item_Locations = preload("res://resources/item_locations.tres")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("Interaction triggered!")
	ScreenFilter.fade_to_darkness()
	await get_tree().create_timer(0.6).timeout

	for i in range(item_location.items.size()):
		var item = item_location.items[i]
		if item.position_x == global_position.x && item.position_y == global_position.y:
			print("wkdmw")
			#if item.name == "lab_door_interior":
			var shift = door_relation(item.name)
			if i + shift < item_location.items.size() && i + shift >= 0:
				var next_item = item_location.items[i + shift]
				print(next_item.position_x)
				player.global_position = Vector2(next_item.position_x, next_item.position_y)
				break
	#if global_position.x == 111.5 && global_position.y == 4:
		#player.global_position.x = -633  # Move the player 50 pixels to the right
		#player.global_position.y = 45
	#elif global_position.x == -633 && global_position.y == 45:
		#player.global_position.x = 111  # Move the player 50 pixels to the right
		#player.global_position.y = 20
	print(">>",global_position)
	CameraManager.refresh = true
	ScreenFilter.fade_from_darkness()

func door_relation(location: String):
	if location == "lab_door_exterior":
		return 1
	elif location == "lab_door_interior":
		return -1
	elif location == "hallway_door_exterior":
		return 1
	elif location == "hallway_door_interior": 
		return -1
	elif location == "forum_door_exterior":
		return 1
	elif location == "forum_door_interior": 
		return -1
	pass
