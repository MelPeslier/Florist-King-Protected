extends Node

enum Phase {
	DAY,
	NIGHT
}
@export var phase: Phase
@export var title_message: String
@export var start_of_recap_message: String
@export var default_message: String
@export var next_phase_path: String

var summary: Array[String] = []

@onready var recap_template = preload("res://menus/recaps/recap_template.tscn")

func _ready() -> void:
	match phase:
		Phase.DAY:
			default_message += " " + str(ScoreManager.get_score()) + " !"


func add_to_list(list:Array):
	# Each time something happen we put it on the summary
	# Must look on how to implement a few versions of text only or so !
	# To implement when flowers and languages are working
	
	if list.size() == 0: # You've done everything right!
		summary.append("Everything seems fine!")
	else:
		summary.append_array(list)
	



func _on_timer_timeout():
	# Adding the right messages
	var recap_message: String = start_of_recap_message
	
	if summary.size() == 0:
		recap_message += "\n" + default_message
	else:
		for info in summary:
			recap_message += "\n" + info
	
	# Instantiate RecapTemplate and add it to tree
	var recap = recap_template.instantiate()
	add_child(recap)
	
	# Writte messages (start animation on it's own)
	recap.initialise(
		title_message + " " + str(ScoreManager.get_day()) + " completed !",
		recap_message,
		next_phase_path
	)
	ScoreManager.next_day()
