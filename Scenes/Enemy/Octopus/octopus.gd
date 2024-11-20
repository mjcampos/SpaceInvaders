extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var left_thigh: CollisionShape2D = $LeftThigh
@onready var right_thigh: CollisionShape2D = $RightThigh

@onready var left_leg: CollisionShape2D = $LeftLeg
@onready var right_leg: CollisionShape2D = $RightLeg

@onready var left_foot: CollisionShape2D = $LeftFoot
@onready var right_foot: CollisionShape2D = $RightFoot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	match animated_sprite_2d.frame:
		0:
			frame_starting_position()
		1:
			frame_end_position()

func frame_starting_position():
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
	
func frame_end_position():
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


func _on_area_entered(area: Area2D):
	handle_laser_detection()
