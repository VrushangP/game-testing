extends Node2D
 
var refresh = true
var local_map_range = null
var local_map_name = ""
var maps = null

func camera_update(maps: Array):
	var player = get_tree().get_first_node_in_group("Guard1")
	for map in maps:
		local_map_name = map.name
		local_map_range = map_range(map)
		print(local_map_range, "<<<")
		if player.position.x > local_map_range[0] && player.position.x < local_map_range[2] && player.position.y > local_map_range[1] && player.position.y < local_map_range[3]:
			print("ew")
			break
	print(local_map_range)
	refresh = false
	return [local_map_range[0], local_map_range[1], local_map_range[2], local_map_range[3], local_map_name]
	#pass # Replace with function body.

func map_range(tilemap: TileMap):
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.rendering_quadrant_size
	return [
		map_rect.position.x * tile_size, 
		map_rect.position.y * tile_size,
		map_rect.end.x * tile_size,
		map_rect.end.y * tile_size
		]
