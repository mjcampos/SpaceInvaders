extends Enemy

@onready var next_movement_timer: Timer = $NextMovementTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var points = [50, 100, 150, 200, 300]
var speed: float = 200
var min_time: float = 5
var max_time: float = 10
var start_position: Vector2
var end_position: Vector2
var is_moving: bool = false

func _ready():
	var sprite_width = animated_sprite_2d.sprite_frames.get_frame_texture("default", 0).get_width()
	
	# Set initial random point
	_points = points[randi() % points.size()]
	
	# Store the UFO's starting position
	start_position = Vector2(-sprite_width, position.y)
	end_position = Vector2(get_viewport_rect().size.x + sprite_width, position.y)
	position = start_position
	
	_schedule_next_movement()

func _process(delta):
	if is_moving:
		# Move the UFO horizontally
		position.x += speed * delta
		
		# Check if the UFO has exited the viewport
		if position.x > end_position.x:
			is_moving = false
			position = start_position  # Reset to start position
			_schedule_next_movement()

func _on_area_entered(area: Area2D):
	handle_laser_detection()

func _on_change_point_timeout():
	_points = points[randi() % points.size()]

func _schedule_next_movement():
	# Generate a random delay between min_time and max_time
	var random_delay = randf_range(min_time, max_time)
	
	# Use a timer to trigger the movement
	next_movement_timer.start(random_delay)

func _on_next_movement_timeout():
	is_moving = true
