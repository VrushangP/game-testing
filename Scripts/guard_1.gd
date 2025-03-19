extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -250.0
@export var inventory: Current_Inventory
@export var character: Character

@export var save_path: String = "res://Menus/save_files.tres"

var map_type = 0

func _ready() -> void:
	load_character()

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if map_type == 0:
		var direction_x := Input.get_axis("ui_left", "ui_right")
		var direction_y := Input.get_axis("ui_up", "ui_down")
		if direction_x:
			velocity.x = direction_x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		if direction_y:
			velocity.y = direction_y * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
	elif map_type == 1:
			# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		## Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func load_character ():
	character = Character.new()

	var blank_save_resource = load(save_path)
	character.display_name = blank_save_resource.display_name
	character.level = blank_save_resource.level
	character.experience = blank_save_resource.experience
	character.endurance = blank_save_resource.endurance
	character.strength = blank_save_resource.strength
	character.intelligence = blank_save_resource.intelligence
	position.x = blank_save_resource.pos_x
	position.y = blank_save_resource.pos_y
