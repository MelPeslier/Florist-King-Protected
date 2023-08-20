extends CanvasLayer

const startScene = "res://shop/day/day_shop.tscn"
# Change the scene with the day
const menuMusic = preload("res://audio/music/MenuTheme.ogg")

@onready var audio_wrong = $AudioWrong

@onready var line_edit = $NameRegister/NameRegistering/VBoxContainer/MarginContainer/LineEdit
@onready var name_register = $NameRegister

@onready var credits_control = $RightControl/SharedControl/CreditsControl
@onready var leaderboard_control = $RightControl/SharedControl/LeaderboardControl


func _ready():
	#Audio
	Music.fade_in()
	Music.stream = menuMusic
	Music.play()
	
	# DataManagement
	ScoreManager.reset()
	PlacerData.reset()
	
	#Visibility
	var leaderboard: bool = false
	if ScoreManager.score > 0:
		leaderboard = true
	else:
		leaderboard_control.visible = leaderboard
		credits_control.visible = false
		name_register.visible = false


func _on_play_pressed():
	name_register.visible = true
	line_edit.grab_focus()


func _on_leaderboards_pressed():
	leaderboard_control.visible = !leaderboard_control.visible
	credits_control.visible = !leaderboard_control


func _on_credits_pressed():
	credits_control.visible = !credits_control.visible
	leaderboard_control.visible = !credits_control


func _on_quit_pressed():
	get_tree().quit()


func _on_mouse_entered():
	$Audio.play()



func _on_enter_name_button_up():
	var i = 0
	for j in line_edit.text:
		i+=1
	
	if i < 2:
		audio_wrong.play()
	else:
		ScoreManager.player_name = line_edit.text
		get_tree().change_scene_to_file(startScene)


func _on_back_button_up():
	line_edit.clear()
	line_edit.release_focus()
	name_register.visible = false
