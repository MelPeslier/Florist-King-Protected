extends Label

func _ready():
	text = str(ScoreManager.score)


func update_score():
	text = str(ScoreManager.score)
