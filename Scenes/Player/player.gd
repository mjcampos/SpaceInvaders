extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var _speed: float = 400.0

const LASER = preload("res://Scenes/Player/Laser/laser.tscn")

var viewport_width: float
var sprite_width: float
var is_shooting: bool = false
var laser_offset: Vector2 = Vector2(0, -70.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite_2d.animation_finished.connect(handle_shooting_animation_finished)
	viewport_width = get_viewport_rect().size.x
	sprite_width = animated_sprite_2d.sprite_frames.get_frame_texture("default", 0).get_width()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	
	if Input.is_action_just_pressed("shoot"):
		if not is_shooting:
			shoot()

func move():
	var direction = Input.get_axis("left", "right")
	
	velocity.x = direction * _speed
	
	move_and_slide()
	
	position.x = clamp(position.x, sprite_width/2, viewport_width - sprite_width/2)
	
func shoot():
	var laser_instance = LASER.instantiate()
	
	is_shooting = true
	laser_instance.position = position + laser_offset
	
	# Add the laser to the current scene
	get_tree().current_scene.add_child(laser_instance)
	animated_sprite_2d.play("shooting")

func handle_shooting_animation_finished():
	is_shooting = false
