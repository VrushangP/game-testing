extends Panel

@onready var item_visual: Sprite2D = $item_display

func update(item: Inventory):
	if !item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = item.texture


func _ready() -> void:
	item_visual.visible = false
