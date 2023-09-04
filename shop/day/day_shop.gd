extends Node

const daymusicstart = preload("res://audio/music/day_shop_start.ogg")
const daymusicloop = preload("res://audio/music/day_shop_loop.ogg")
const yes_song = preload("res://audio/sfx/drag_drop/Advance_Dialogue.wav")
const no_song = preload("res://audio/sfx/drag_drop/error_sound.wav")


func _ready():
	Events.play_the_song.connect(_on_play_the_song)
<<<<<<< HEAD
	#Events.change_scene_to.connect(_on_change_scene_to) That function does not exist!
=======
>>>>>>> b4776fe9c0910b14c2072fda9a17ac0b82fe6335
	Pause.canPause = true
#	$UI/Control/Icon.texture = null
	Music.stream = daymusicstart
	Music.play()


func _on_loop_start():
	Music.stream = daymusicloop
	Music.play()


func _on_play_the_song(song:String):
	var val
	match song:
		"yes":
			val = yes_song
		"no":
			val = no_song
	$Audio.stream = val
	$Audio.play()
