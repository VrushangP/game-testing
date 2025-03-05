extends Control

# Scene paths - replace with your actual scene paths
const GAME_SCENE = "res://Scene/white_frost.tscn"
const OPTIONS_SCENE = "res://Menus/option_menu.tscn"
const CREDITS_SCENE = "res://scenes/credits.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	#get_tree().change_scene_to_file(GAME_SCENE)
	var game_scene = load(GAME_SCENE)

	# Check if the scene loaded successfully
	if game_scene:
		# Change to the packed scene
		get_tree().change_scene_to_packed(game_scene)
	else:
		# Optional error handling
		print("Failed to load game scene: ", GAME_SCENE)

func _on_load_pressed() -> void:
	print("Load game functionality not implemented")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file(OPTIONS_SCENE)


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file(CREDITS_SCENE)


func _on_quit_pressed() -> void:
	get_tree().quit()	
