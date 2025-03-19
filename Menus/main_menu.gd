extends Control
# Scene paths - replace with your actual scene paths
const GAME_SCENE = "res://Scene/white_frost.tscn"
const OPTIONS_SCENE = "res://Menus/option_menu.tscn"
const CREDITS_SCENE = "res://scenes/credits.tscn"

@export var base_save: String = "res://Menus/save_files.tres"
@export var blank_save: String = "res://Menus/blank_save.tres"
@export var load_save: String = "res://Menus/load_save.tres"

func _on_play_pressed() -> void:
	# Load blank save into base save
	var blank_save_resource = load(blank_save)
	if blank_save_resource:
		ResourceSaver.save(blank_save_resource, base_save)
		print("Blank save loaded into base save")
	else:
		print("Failed to load blank save")
	
	# Load game scene
	var game_scene = load(GAME_SCENE)
	# Check if the scene loaded successfully
	if game_scene:
		# Change to the packed scene
		get_tree().change_scene_to_packed(game_scene)
	else:
		# Optional error handling
		print("Failed to load game scene: ", GAME_SCENE)

func _on_load_pressed() -> void:
	# Load saved game into base save
	var load_save_resource = load(load_save)
	if load_save_resource:
		ResourceSaver.save(load_save_resource, base_save)
		print("Load save loaded into base save")
	else:
		print("Failed to load save file")
	
	# Load game scene
	var game_scene = load(GAME_SCENE)
	if game_scene:
		get_tree().change_scene_to_packed(game_scene)
	else:
		print("Failed to load game scene: ", GAME_SCENE)

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file(OPTIONS_SCENE)

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file(CREDITS_SCENE)

func _on_quit_pressed() -> void:
	get_tree().quit()	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
