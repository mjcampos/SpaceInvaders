extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var thigh_gap: CollisionShape2D = $ThighGap

@onready var left_thigh: CollisionShape2D = $LeftThigh
@onready var left_ankle: CollisionShape2D = $LeftAnkle
@onready var left_foot_1: CollisionShape2D = $LeftFoot1
@onready var left_foot_2: CollisionShape2D = $LeftFoot2

@onready var right_ankle: CollisionShape2D = $RightAnkle
@onready var right_thigh: CollisionShape2D = $RightThigh
@onready var right_foot_1: CollisionShape2D = $RightFoot1
@onready var right_foot_2: CollisionShape2D = $RightFoot2

func _physics_process(delta):
	match animated_sprite_2d.frame:
		0:
			frame_starting_position()
		1:
			frame_end_position()

func frame_starting_position():
	# Thigh gap
	thigh_gap.position = Vector2(0.0, 4.5)
	
	# Thights
	left_thigh.position = Vector2(-7.5, 4.5)
	right_thigh.position = Vector2(7.5, 4.5)
	
	# Ankles
	left_ankle.position = Vector2(-10.5, 7.5)
	right_ankle.position = Vector2(10.5, 7.5)
	
	# Feet
	left_foot_1.position = Vector2(-7.5, 10.5)
	right_foot_1.position = Vector2(7.5, 10.5)
	
	# Extra feet
	left_foot_2.disabled = true
	right_foot_2.disabled = true
	
func frame_end_position():
	thigh_gap.position = Vector2(0.0, 7.5)
	
	# Thights
	left_thigh.position = Vector2(-4.5, 4.5)
	right_thigh.position = Vector2(4.5, 4.5)
	
	# Ankles
	left_ankle.position = Vector2(-7.5, 7.5)
	right_ankle.position = Vector2(7.5, 7.5)
	
	# Feet
	left_foot_1.position = Vector2(-10.5, 10.5)
	right_foot_1.position = Vector2(4.5, 10.5)

	# Extra feet
	left_foot_2.disabled = false
	right_foot_2.disabled = false


func _on_area_entered(area: Area2D):
	handle_laser_detection()
