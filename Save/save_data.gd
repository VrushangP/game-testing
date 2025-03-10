extends Resource

class_name Save_Data
const SAVE_GAME_PATH := "res://Menus/save_files.tres"

@export var character: Resource
@export var inventory: Resource

@export var map_name := ""
@export var global_position := Vector2.ZERO

func write_savegame() -> void:
	ResourceSaver.save(self, SAVE_GAME_PATH)

static func load_savegame() -> Resource: 
	if ResourceLoader.exists(SAVE_GAME_PATH): 
		return load (SAVE_GAME_PATH)
	return null
