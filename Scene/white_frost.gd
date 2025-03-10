extends Node2D

@export var item_location: Item_Locations
@export var resource_path: String = "res://resources/item_locations.tres"

@export var save_path: String = "res://Menus/save_files.tres"

#var base_save: Save_Data

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var save_data = load(save_path)
	
	# Check if the save data loaded successfully
	if save_data:
		# Print the save data
		print("Save data loaded successfully")
		print("Save data contents:")
		
		# Print all properties of the save data
		# This assumes your Save_Data class inherits from Resource
		for property in save_data.get_property_list():
			var property_name = property["name"]
			# Skip built-in properties that start with underscore
			if not property_name.begins_with("_"):
				var value = save_data.get(property_name)
				print(property_name + ": " + str(value))
	else:
		print("Failed to load save data from: " + save_path)
	
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

func save_game() -> void:
	pass
	
func load_game():
	pass
