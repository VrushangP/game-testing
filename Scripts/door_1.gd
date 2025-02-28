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

	if global_position.x == -102 && global_position.y == -53:
		player.global_position.x = -400  # Move the player 50 pixels to the right
		player.global_position.y = 0
	elif global_position.x == -371 && global_position.y == 13:
		player.global_position.x = 0  # Move the player 50 pixels to the right
		player.global_position.y = 0
	print(global_position)
	

	
	ScreenFilter.fade_from_darkness()

	#DialogManager.start_dialog(global_position, lines, speech_sound)
	#sprite.flip_h = true if interaction_area.get_overlapping_bodies()[0].global_position.x < global_position.x else f 
	#await DialogManager.dialog_finished
