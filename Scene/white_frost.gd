extends Node2D

@export var item_location: Item_Locations
@export var resource_path: String = "res://resources/item_locations.tres"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_location.items.clear()
	var animated_bodies = get_tree().get_nodes_in_group("collectible_bodies")
	for body in animated_bodies:
		var item_desc = Item_Descriptions.new()
		item_desc.name = body.name
		#if body.has("description"):
			#item_desc.description = body.description
		item_desc.position_x = body.position.x
		item_desc.position_y = body.position.y
		item_location.items.append(item_desc)
	save_resource()
	pass # Replace with function body.

func save_resource() -> void:
	var error = ResourceSaver.save(item_location, resource_path)
	if error != OK:
		print("An error occurred while saving the resource")
	else:
		print("Resource saved successfully to ", resource_path)

func load_resource() -> Item_Locations:
	if ResourceLoader.exists(resource_path):
		var loaded_resource = ResourceLoader.load(resource_path)
		return loaded_resource
	else:
		print("Resource file does not exist")
		return null
