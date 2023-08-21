extends Control


@onready var title = $HBoxContainer/Control/VBoxContainer/MarginTitle/Title
@onready var recap = $HBoxContainer/Control/VBoxContainer/Recap

var path: String


# Called when the node enters the scene tree for the first time.
func initialise(title_text: String, recap_text: String, path_text):
	title.text = title_text
	recap.text = recap_text
	path = path_text


func _on_continue_button_up():
	get_tree().change_scene_to_file(path)
