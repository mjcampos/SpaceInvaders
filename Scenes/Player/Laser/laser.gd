extends Area2D

@onready var animSprite: AnimatedSprite2D = $AnimatedSprite2D

var _speed: float = 500.0
var sprite_height: float

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_height = animSprite.sprite_frames.get_frame_texture("default", 0).get_height()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= delta * _speed
	
	if position.y < -sprite_height:
		queue_free()
