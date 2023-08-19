extends CanvasLayer

@onready var day = "res://shop/day/day_shop.tscn"

var summary = []

func _ready():
	visible = false
	$AnimationPlayer.play("RESET")
	$NightXCompleted.text = "Night " + str(ScoreManager.get_day()) + " completed!"



func add_to_list(list:Array): # Needs an array of strings
	# Store all the messages in a variable during
	#  the night, then feed them to this function 
	#   when creating the summary.
	
	if list.size() == 0: # You've done everything right!
		summary.append("Everything seems fine!")
	else:
		summary.append_array(list)
	
	for i in summary:
		$List.text = $List.text + i + "\n"

func _on_continue_pressed():
	# Go to next day
	ScoreManager.next_day()
	# M U S T  Be CHANGE_SCENE_TO_FILE to escape bugs (it wait time that the process end 
	# => time to finish data and all stuff
	get_tree().change_scene_to_file(day)


func _on_timer_timeout():
	Music.fade_out()
	visible = true
	$AnimationPlayer.play("come_in")
