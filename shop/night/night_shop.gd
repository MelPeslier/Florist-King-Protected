extends Node2D

const game_over = preload("res://menus/night/GameOver.tscn")
@onready var timer = $Timer

func _ready():
	Events.player_death.connect(_on_player_death)


func _on_player_death(message:String):
	timer.stop()
	var death = game_over.instantiate()
	death.set_death_cause(message)
	add_child(death)
