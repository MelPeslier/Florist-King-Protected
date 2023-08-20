extends Label

func _ready():
	ScoreManager.update_score.connect(_on_update_score)
	text = str(ScoreManager.get_score()) + " €"


func _on_update_score(score: float):
	text = str(score) + " €"
