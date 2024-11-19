extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var torso: CollisionShape2D = $Torso

@onready var left_thigh: CollisionShape2D = $LeftThigh
@onready var left_shin: CollisionShape2D = $LeftShin
@onready var left_foot: CollisionShape2D = $LeftFoot

@onready var right_thigh: CollisionShape2D = $RightThigh
@onready var right_shin: CollisionShape2D = $RightShin
@onready var right_foot: CollisionShape2D = $RightFoot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match animated_sprite_2d.frame:
		0:
			frame_starting_position()
		1:
			frame_end_position()

func frame_starting_position():
	# Torso
	torso.shape.set_size(Vector2(30.0, 21.0))
	torso.position = Vector2(0.0, -12.5)

	# Thighs
	left_thigh.shape.set_size(Vector2(6.0, 3.0))
	left_thigh.position = Vector2(-12.0, -0.5)
	
	right_thigh.shape.set_size(Vector2(6.0, 3.0))
	right_thigh.position = Vector2(12.0, -0.5)
	
	# Shins
	left_shin.disabled = false
	right_shin.disabled = false
	
	# Feet
	left_foot.disabled = false
	right_foot.disabled = false

func frame_end_position():
	# Torso
	torso.shape.set_size(Vector2(24.0, 21.0))
	torso.position = Vector2(1.0, -12.5)

	# Thighs
	left_thigh.shape.set_size(Vector2(6.0, 3.0))
	left_thigh.position = Vector2(-8.0, -0.5)
	
	right_thigh.shape.set_size(Vector2(6.0, 3.0))
	right_thigh.position = Vector2(10.0, -0.5)
	
	# Shins
	left_shin.disabled = true
	right_shin.disabled = true
	
	# Feet
	left_foot.disabled = true
	right_foot.disabled = true
