extends Node

# Persistent data that can be accessed across scenes
var current_level: int = 1
var player_health: int = 100
var collected_items: Array = []

# Example of saving game state
func save_game_state() -> void:
	var save_data = {
		"level": current_level,
		"health": player_health,
		"items": collected_items
	}
	# You can implement more complex saving logic here
	print("Game state saved")

# Example of loading game state
func load_game_state() -> void:
	# Implement your loading logic here
	# This could read from a file, database, etc.
	print("Game state loaded")

# Scene transition method
func change_to_scene(scene_path: String) -> void:
	var packed_scene = load(scene_path)
	if packed_scene:
		get_tree().change_scene_to_packed(packed_scene)
	else:
		print("Failed to load scene: ", scene_path)
