extends Control  # Use Node2D instead of Control

@onready var panel = $Panel
@onready var player = get_tree().get_first_node_in_group("Guard1")

func _ready():
	# Ensure the CanvasLayer is on top of everything
	panel.visible = false  # High value to ensure it's above everything

func visible():
	print("happening")
