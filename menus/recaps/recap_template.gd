extends CanvasLayer

var path: String

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var title: Label = $Control/HBoxContainer/Control/VBoxContainer/MarginTitle/Title
@onready var recap: Label = $Control/HBoxContainer/Control/VBoxContainer/Recap


func _ready() -> void:
	visible = true
	animation_player.play("RESET")
	print("ready done")


func initialise(title_text: String, recap_text: String, path_text):
	title.text = title_text
	recap.text = recap_text
	path = path_text
	animation_player.play("DISPLAY")
	print("display done")


func _on_continue_button_up():
	get_tree().change_scene_to_file(path)
