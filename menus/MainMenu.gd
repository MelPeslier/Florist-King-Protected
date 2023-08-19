extends CanvasLayer

const startScene = preload("res://shop/day/day_shop.tscn")
# Change the scene with the day
const menuMusic = preload("res://audio/music/MenuTheme.ogg")

func _ready():
	Music.stream = menuMusic
	Music.play()

func _on_play_pressed():
	get_tree().change_scene_to_packed(startScene)


func _on_leaderboards_pressed():
	$Credits/CreditsPanel.visible = false
	# Mel will deal with this
	# How about the list appears in the 
	#  same place the credits appear?
	pass

func _on_credits_pressed():
	$Credits/CreditsPanel.visible = !$Credits/CreditsPanel.visible


func _on_quit_pressed():
	get_tree().quit()





func _on_mouse_entered():
	$Audio.play()
