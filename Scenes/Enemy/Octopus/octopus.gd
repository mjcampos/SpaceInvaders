extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var left_thigh: CollisionShape2D = $LeftThigh
@onready var right_thigh: CollisionShape2D = $RightThigh

@onready var left_leg: CollisionShape2D = $LeftLeg
@onready var right_leg: CollisionShape2D = $RightLeg

@onready var left_foot: CollisionShape2D = $LeftFoot
@onready var right_foot: CollisionShape2D = $RightFoot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	toggle_collisions()

func toggle_collisions():
	match animated_sprite_2d.frame:
		0:
			# Thighs
			left_thigh.shape.set_size(Vector2(9.0, 6.0))
			left_thigh.position = Vector2(-13.5, 9.0)
			
			right_thigh.shape.set_size(Vector2(9.0, 6.0))
			right_thigh.position = Vector2(13.5, 9.0)
			
			# Legs
			left_leg.position = Vector2(-18.0, 15.0)
			right_leg.position = Vector2(18.0, 15.0)
			
			# Feet
			left_foot.position = Vector2(-30.0, 21.0)
			right_foot.position = Vector2(30.0, 21.0)
		1:
			# Thighs
			left_thigh.shape.set_size(Vector2(15.0, 6.0))
			left_thigh.position = Vector2(-16.5, 9.0)
			
			right_thigh.shape.set_size(Vector2(15.0, 6.0))
			right_thigh.position = Vector2(16.5, 9.0)
			
			# Legs
			left_leg.position = Vector2(-24.0, 15.0)
			right_leg.position = Vector2(24.0, 15.0)
			
			# Feet
			left_foot.position = Vector2(-18.0, 21.0)
			right_foot.position = Vector2(18.0, 21.0)
