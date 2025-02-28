extends AnimatableBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D
@onready var speech_sound = preload("res://Assets/sounds/coin.wav")


const lines: Array[String] = [
	"Hey there!"
]

func _ready():
	print("Ready function called")
	if interaction_area:
		print("InteractionArea found")
		interaction_area.interact = Callable(self, "_on_interact")
		print("Callable assigned")
	else:
		print("ERROR: InteractionArea not found")

func _on_interact():
	print("Interaction triggered!")

	#DialogManager.start_dialog(global_position, lines, speech_sound)
	#sprite.flip_h = true if interaction_area.get_overlapping_bodies()[0].global_position.x < global_position.x else f 
	#await DialogManager.dialog_finished
