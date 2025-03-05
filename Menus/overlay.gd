extends CanvasLayer

# Reference to the overlay node (e.g., a Panel or Control node)
@onready var overlay = $Overlay

func _ready():
	# Ensure the overlay is perfectly centered
	overlay.anchor_left = 1
	overlay.anchor_top = 0.5
	overlay.anchor_right = 0.5
	overlay.anchor_bottom = 0.5

	# Set the pivot point to the center
	overlay.pivot_offset = overlay.size / 2

	# Reset position to ensure centering
	overlay.position = Vector2.ZERO

	# Optionally, set the overlay's origin point to its center
	overlay.position -= overlay.size / 2

# Alternative centering method if the above doesn't work
func center_overlay():
	var viewport_size = get_viewport().get_visible_rect().size
	overlay.position = viewport_size / 2 - overlay.size / 2
# Example of showing/hiding the overlay
func show_overlay():
	overlay.visible = true

func hide_overlay():
	overlay.visible = false

# Optional: Add a method to update overlay content
func set_overlay_text(text: String):
	$Overlay/Label.text = text
