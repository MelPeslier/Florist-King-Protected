extends CanvasLayer

var summary := []


func _ready():
	$HBoxContainer/Control/VBoxContainer/MarginTitle/Title.text = "Night " + str(ScoreManager.get_day()) + " completed!"



func add_to_list(list:Array): # Needs an array of strings
	# Store all the messages in a variable during
	#  the night, then feed them to this function 
	#   when creating the summary.
	
	if list.size() == 0:
		summary.append("Everything seems fine!")
	else:
		summary.append_array(list)
	



func _on_timer_timeout():
	visible = true
	get_tree().paused = true
	Pause.canPause = false
	Music.fade_out()
	$AnimationPlayer.play("come_in")
	ScoreManager.next_day()

func _on_continue_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://shop/day/day_shop.tscn")
