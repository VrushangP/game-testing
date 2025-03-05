extends AnimatableBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D
@onready var speech_sound = preload("res://Assets/sounds/coin.wav")
@onready var player = get_tree().get_first_node_in_group("Guard1")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("Interaction triggered!")
	ScreenFilter.fade_to_darkness()
	
	await get_tree().create_timer(0.6).timeout

	if global_position.x == 113 && global_position.y == 8:
		player.global_position.x = -633  # Move the player 50 pixels to the right
		player.global_position.y = 45
	elif global_position.x == -633 && global_position.y == 45:
		player.global_position.x = 111  # Move the player 50 pixels to the right
		player.global_position.y = 20
	print(global_position)
	CameraManager.refresh = true

	

	
	ScreenFilter.fade_from_darkness()

	#DialogManager.start_dialog(global_position, lines, speech_sound)
	#sprite.flip_h = true if interaction_area.get_overlapping_bodies()[0].global_position.x < global_position.x else f 
	#await DialogManager.dialog_finished
