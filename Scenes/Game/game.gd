extends Node2D

@onready var score_text: Label = $UI/ScoreText

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_score_update.connect(handle_score_update)
	
	score_text.text = ScoreManager.get_modified_score()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func handle_score_update():
	score_text.text = ScoreManager.get_modified_score()
