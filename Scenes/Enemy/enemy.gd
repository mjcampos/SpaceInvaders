class_name Enemy
extends Area2D

@export var _points: int

func handle_laser_detection():
	queue_free()
