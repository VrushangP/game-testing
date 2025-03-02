extends Control

@onready var inventory: Current_Inventory = preload("res://Inventory/player_inventory.tres")
@onready var slots: Array = $GridContainer.get_children()

var is_open = false

func _ready():
	update_slots()
	close()
	
func update_slots():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])
	
func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()
	
func open():
	is_open = true
	visible = true

func close():
	is_open = false
	visible = false
