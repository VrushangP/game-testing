extends Camera2D

@onready var player = get_tree().get_first_node_in_group("Guard1")
@onready var map_boundary = get_tree().get_nodes_in_group("map_boundary")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_map()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_map()
	
func update_map():
	if CameraManager.refresh == true:
		var limits = CameraManager.camera_update(map_boundary)
		limit_left = limits[0]
		limit_top = limits[1]
		limit_right = limits[2]
		limit_bottom = limits[3]
		print(limits[4])
		if limits[4] == "hallway":
			player.map_type = 1
		else:
			player.map_type = 0
