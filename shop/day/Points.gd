extends Label

func _ready():
	ScoreManager.connect("update_score", _on_update_score)
	text = str(ScoreManager.get_score()) + " €"


func _on_update_score(score: float):
	text = str(score)
