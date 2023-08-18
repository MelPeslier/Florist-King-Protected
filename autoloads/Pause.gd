extends CanvasLayer

var paused := false

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		if paused:
			unpause()
		else:
			pause()

func pause():
	paused = true
	get_tree().paused = true
	Music.fade_out()
	visible = true

func unpause():
	paused = false
	get_tree().paused = false
	Music.fade_in()
	visible = false


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")
