extends CanvasLayer

var canPause := false

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("pause") && canPause:
		if get_tree().paused:
			unpause()
		else:
			pause()

func pause():
	get_tree().paused = true
	Music.fade_out()
	visible = true
	$Audio.play()

func unpause():
	get_tree().paused = false
	Music.fade_in()
	visible = false


func _on_main_menu_pressed():
	unpause()
	canPause = false
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")
