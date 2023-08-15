extends CanvasLayer

const startScene = preload("res://shop/night_shop.tscn")
# Change the scene with the day

func _on_play_pressed():
	get_tree().change_scene_to_packed(startScene)


func _on_leaderboards_pressed():
	# Mel will deal with this
	pass


func _on_quit_pressed():
	get_tree().quit()
