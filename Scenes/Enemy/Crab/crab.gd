extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var left_arm: CollisionShape2D = $LeftArm
@onready var right_arm: CollisionShape2D = $RightArm

@onready var left_foot: CollisionShape2D = $LeftFoot
@onready var right_foot: CollisionShape2D = $RightFoot

func _process(delta):
	toggle_collisions()

func toggle_collisions():
	match animated_sprite_2d.frame:
		0:
			# Arms
			left_arm.shape.set_size(Vector2(4.0, 16.0))
			left_arm.position = Vector2(-20.0, -8.0)
			
			right_arm.shape.set_size(Vector2(4.0, 16.0))
			right_arm.position = Vector2(20.0, -8.0)
			
			# Feet
			left_foot.position = Vector2(-18.0, 18.0)
			right_foot.position = Vector2(18.0, 18.0)
		1:
			# Arms
			left_arm.shape.set_size(Vector2(4.0, 12.0))
			left_arm.position = Vector2(-20.0, 2.0)
			
			right_arm.shape.set_size(Vector2(4.0, 12.0))
			right_arm.position = Vector2(20.0, 2.0)
			
			# Feet
			left_foot.position = Vector2(-10.0, 18.0)
			right_foot.position = Vector2(10.0, 18.0)
