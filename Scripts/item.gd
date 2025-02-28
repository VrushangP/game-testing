extends AnimatableBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $AnimatedSprite2D

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("Interaction triggered!")
	print("item found")
	#print(label.text)
	sprite.animation = "active"

	ScreenFilter.dim_screen()
