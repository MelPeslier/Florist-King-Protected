extends CanvasLayer


func _on_try_again_pressed():
	get_tree().reload_current_scene()
	# Restart the night


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://menus/MainMenu.tscn")
