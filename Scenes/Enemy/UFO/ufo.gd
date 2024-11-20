extends Enemy

func _on_area_entered(area: Area2D):
	handle_laser_detection()
