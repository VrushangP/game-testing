extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Export variables to customize the dimmer
@export var dim_color: Color = Color(0, 0, 0, 0.5)  # Black with 50% opacity
@export var full_dark_color: Color = Color(0, 0, 0, 1.0)  # Complete darkness color

@export var transition_time: float = 0.5  # Time in seconds for fading
@export var dimmer_enabled: bool = true  # Enable/disable the dimmer

# Node references
var dimmer_rect: ColorRect
var is_faded_to_black: bool = false


func _ready():
	# Create a ColorRect that covers the entire screen
	dimmer_rect = ColorRect.new()
	dimmer_rect.color = Color(dim_color.r, dim_color.g, dim_color.b, 0)  # Start fully transparent
	dimmer_rect.set_anchors_preset(Control.PRESET_FULL_RECT)  # Cover the entire screen
	add_child(dimmer_rect)
	
	# Initialize in hidden state
	dimmer_rect.visible = false

# Call this when dialogue starts
func dim_screen():
	if not dimmer_enabled:
		return
	
	dimmer_rect.visible = true
	var tween = create_tween()
	tween.tween_property(dimmer_rect, "color", dim_color, transition_time)

# Call this when dialogue ends
func restore_brightness():
	if not dimmer_enabled:
		return
	
	var tween = create_tween()
	tween.tween_property(dimmer_rect, "color", Color(dim_color.r, dim_color.g, dim_color.b, 0), transition_time)
	tween.tween_callback(func(): dimmer_rect.visible = false)

# For convenience, toggle the dimmer state
func toggle_dimmer():
	if dimmer_rect.color.a < 0.01:
		dim_screen()
	else:
		restore_brightness()

func fade_to_darkness(time: float = transition_time):
	dimmer_rect.visible = true
	var tween = create_tween()
	tween.tween_property(dimmer_rect, "color", full_dark_color, time)
	is_faded_to_black = true

# Fade from darkness to dimmed or normal
func fade_from_darkness(to_normal: bool = true, time: float = transition_time):
	var tween = create_tween()
	
	if to_normal:
		tween.tween_property(dimmer_rect, "color", Color(dim_color.r, dim_color.g, dim_color.b, 0), time)
		tween.tween_callback(func(): dimmer_rect.visible = false)
	else:
		tween.tween_property(dimmer_rect, "color", dim_color, time)
	
	is_faded_to_black = false

# For scene transitions or dramatic effect
func fade_to_darkness_and_back(stay_dark_time: float = 1.0, fade_time: float = transition_time):
	var tween = create_tween()
	dimmer_rect.visible = true
	
	# Fade to black
	tween.tween_property(dimmer_rect, "color", full_dark_color, fade_time)
	
	# Stay dark for the specified time
	tween.tween_interval(stay_dark_time)
	
	# Fade back to normal
	tween.tween_property(dimmer_rect, "color", Color(dim_color.r, dim_color.g, dim_color.b, 0), fade_time)
	tween.tween_callback(func(): dimmer_rect.visible = false)
