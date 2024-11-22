extends Enemy

var points = [50, 100, 150, 200, 300]

func _ready():
	_points = points[randi() % points.size()]  # Set initial random point

func _on_area_entered(area: Area2D):
	handle_laser_detection()

func _on_timer_timeout():
	_points = points[randi() % points.size()]
