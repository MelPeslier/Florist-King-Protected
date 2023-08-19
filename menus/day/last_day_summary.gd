extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	$Control.modulate.a = 0.0


func _on_day_summary_last_day():
	visible = true
	$Control/VBoxContainer/MarginContainer/Score.text = str(ScoreManager.get_score()) + " €"
	$Control.go()

