extends Node

var score: int = 0

func get_modified_score():
	return str(score).pad_zeros(4)

func add_to_score(points: int):
	score += points
	SignalManager.on_score_update.emit()
