extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	print("entered")
	if body.is_in_group("Guard1"):
		InteractionManager.register_area(self)
	pass # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	print("left")
	if body.is_in_group("Guard1"):
		InteractionManager.unregister_area(self)
	pass # Replace with function body.
