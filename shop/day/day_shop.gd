extends Node

var yes_song = preload("res://audio/sfx/drag_drop/Advance_Dialogue.wav")
var no_song = preload("res://audio/sfx/drag_drop/error_sound.wav")


func _ready():
	Events.play_the_song.connect(_on_play_the_song)
#	$UI/Control/Icon.texture = null


func _on_play_the_song(song:String):
	var val
	match song:
		"yes":
			val = yes_song
		"no":
			val = no_song
	$Audio.stream = val
	$Audio.play()



