extends CanvasLayer

var summary = []

func _ready():
	$NightXCompleted.text = "Night " + str(Global.dayNum) + " completed!"


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
	Global.dayNum += 1
	pass 
