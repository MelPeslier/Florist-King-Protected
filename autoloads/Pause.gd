extends CanvasLayer

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			unpause()
		else:
			pause()

func pause():
	get_tree().paused = true
	Music.fade_out()
	visible = true

func unpause():
	get_tree().paused = false
	Music.fade_in()
	visible = false


func _on_main_menu_pressed():
	unpause()
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")
