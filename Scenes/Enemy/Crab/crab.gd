extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var left_arm_0: CollisionShape2D = $LeftArm_0
@onready var left_arm_1: CollisionShape2D = $LeftArm_1
@onready var right_arm_0: CollisionShape2D = $RightArm_0
@onready var right_arm_1: CollisionShape2D = $RightArm_1

@onready var left_foot_0: CollisionShape2D = $LeftFoot_0
@onready var left_foot_1: CollisionShape2D = $LeftFoot_1
@onready var right_foot_0: CollisionShape2D = $RightFoot_0
@onready var right_foot_1: CollisionShape2D = $RightFoot_1

func _process(delta):
	toggle_collisions()

func toggle_collisions():
	match animated_sprite_2d.frame:
		0:
			left_arm_0.disabled = false
			right_arm_0.disabled = false
			
			left_foot_0.disabled = false
			right_foot_0.disabled = false
			
			left_arm_1.disabled = true
			right_arm_1.disabled = true
			
			left_foot_1.disabled = true
			right_foot_1.disabled = true
		1:
			left_arm_0.disabled = true
			right_arm_0.disabled = true
			
			left_foot_0.disabled = true
			right_foot_0.disabled = true
			
			left_arm_1.disabled = false
			right_arm_1.disabled = false
			
			left_foot_1.disabled = false
			right_foot_1.disabled = false
