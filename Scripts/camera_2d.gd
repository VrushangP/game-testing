extends Camera2D

@onready var player = get_tree().get_first_node_in_group("Guard1")

@export var exterior_map: TileMap
@export var interior_map: TileMap

var local_map_range = null
var maps = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if CameraManager.refresh == true:
		print("happening")
		maps = [exterior_map, interior_map]
		var limits = CameraManager.camera_update(maps)
		limit_left = limits[0]
		limit_top = limits[1]
		limit_right = limits[2]
		limit_bottom = limits[3]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if CameraManager.refresh == true:
		maps = [exterior_map, interior_map]
		var limits = CameraManager.camera_update(maps)
		limit_left = limits[0]
		limit_top = limits[1]
		limit_right = limits[2]
		limit_bottom = limits[3]
