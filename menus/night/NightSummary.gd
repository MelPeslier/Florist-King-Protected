extends CanvasLayer

var day_path = "res://shop/day/day_shop.tscn"

var summary := []
@onready var animation_player = $AnimationPlayer
@onready var recap_template = $RecapTemplate

func _ready():
	visible = false



func add_to_list(list:Array): # Needs an array of strings
	# Store all the messages in a variable during
	#  the night, then feed them to this function 
	#   when creating the summary.
	
	if list.size() == 0: # You've done everything right!
		summary.append("Everything seems fine!")
	else:
		summary.append_array(list)
	



func _on_timer_timeout():
	var recap_message: String = "Night Summary :"
	for info in summary:
		recap_message += "\n" + info

	Music.fade_out()
	visible = true
	
	recap_template.initialise(
		"Night " + str(ScoreManager.get_day()) + " completed!",
		recap_message,
		day_path
	)
	animation_player.play("come_in")
	ScoreManager.next_day()
