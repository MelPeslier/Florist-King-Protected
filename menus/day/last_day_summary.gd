extends CanvasLayer


func _ready():
	visible = false
	$Control.modulate.a = 0.0


func _on_day_summary_last_day():
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(ScoreManager.player_name, ScoreManager.score).sw_save_score_complete
	print("Score persisted successfully: " + str(sw_result.score_id))
	
	# Visibility
	visible = true
	$Control/VBoxContainer/MarginContainer/Score.text = str(ScoreManager.get_score()) + " €"
	$Control.go()



func _on_continue_button_up():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")


