class_name Enemy
extends Area2D

enum EnemySize {
	SMALL = 1,
	MEDIUM = 2,
	LARGE = 3
}

@export var enemy_size: EnemySize = EnemySize.SMALL
@export var _points: int

const EXPLOSION = preload("res://Scenes/Enemy/explosion.tscn")

func handle_laser_detection():
	# Remove enemy from scene
	queue_free()
	
	# Update the score manager
	ScoreManager.add_to_score(_points)
	
	# Replace enemy with explosion
	var explosion_instance = EXPLOSION.instantiate()
	
	explosion_instance.scale = Vector2(enemy_size, enemy_size)
	
	explosion_instance.global_position = global_position
	#get_tree().root.add_child(explosion_instance)
	get_parent().add_child(explosion_instance)
