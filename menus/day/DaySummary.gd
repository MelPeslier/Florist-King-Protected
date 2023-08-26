extends CanvasLayer

signal last_day()


func _ready():
	$HBoxContainer/Control/VBoxContainer/MarginTitle/Title.text = "Day " + str(ScoreManager.get_day()) + " completed!"
	$HBoxContainer/Control/VBoxContainer/Recap.text = "You now have: " + str(ScoreManager.get_score()) + " €"


func _on_day_timer_timeout():
	visible = true
	get_tree().paused = true
	Pause.canPause = false
	Music.fade_out()
	if ScoreManager.get_day() < ScoreManager.get_max_day():
		$AnimationPlayer.play("come_in")
	else:
		emit_signal("last_day")

func _on_continue_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://shop/night/night_shop.tscn")


