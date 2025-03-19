extends Control

@onready var player = get_tree().get_first_node_in_group("Guard1")
@export var save_path: String = "res://Menus/save_files.tres"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_resume_pressed() -> void:
	pass # Replace with function body.


func _on_save_pressed() -> void:
	pass # Replace with function body.


func _on_load_pressed() -> void:
	pass # Replace with function body.


func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()	

func save_data():
	pass
