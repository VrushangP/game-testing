extends AnimatableBody2D

@onready var player = get_tree().get_first_node_in_group("Guard1")
@onready var dialogue_area: DialogueArea = $Dialogue_area


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue_area.interact = Callable(self, "_on_interact")
	#interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	await get_tree().create_timer(0.1).timeout
	print("cunny!")
