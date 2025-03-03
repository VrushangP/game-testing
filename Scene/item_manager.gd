extends Node

class_name Item_Manager
var items_data = []
var inventory_cache = {}

func _ready():
	load_items_data()
	
func load_items_data():
	var file = FileAccess.open("res://JSON/item-locations-json.json", FileAccess.READ)	
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.new()
		var error = json.parse(json_string)
		
		if error == OK:
			var data = json.get_data()
			print(data)
			items_data = data.get("items", [])
			print("Loaded " + str(items_data.size()) + " items from JSON")
		else:
			print("JSON Parse Error: ", json.get_error_message(), " at line ", json.get_error_line())
	else:
		print("Could not open items_data.json")

func get_item_at_position(x: float, y: float, tolerance: float = 10.0) -> Dictionary:
	for item in items_data:
		var item_x = float(item.position.x)
		var item_y = float(item.position.y)
		
		# Check if the position is within tolerance
		if abs(item_x - x) <= tolerance and abs(item_y - y) <= tolerance:
			return item
			
	# Return empty dictionary if no item found
	return {}
	
func create_inventory_item(item_data: Dictionary) -> Inventory:
	# Check cache first
	var id = item_data.get("id", "")
	if inventory_cache.has(id):
		return inventory_cache[id]
	
	# Create new inventory item
	var new_item = Inventory.new()
	new_item.name = item_data.get("name", "Unknown Item")
	new_item.texture = load(item_data.get("texture_path", ""))
	
	# Cache it for future use
	inventory_cache[id] = new_item
	
	return new_item
