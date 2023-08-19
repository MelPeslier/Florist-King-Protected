extends Node

var yes_song = preload("res://audio/sfx/drag_drop/Advance_Dialogue.wav")
var no_song = preload("res://audio/sfx/drag_drop/error_sound.wav")


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("play_the_song", _on_play_the_song)


func _on_play_the_song(song:String):
	var val
	match song:
		"yes":
			val = yes_song
		"no":
			val = no_song
	$Audio.stream = val
	$Audio.play()



