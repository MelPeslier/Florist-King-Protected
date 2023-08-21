extends Node2D

@onready var game_over = $GameOver
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.player_death.connect(_on_player_death)


func _on_player_death(message:String):
	timer.stop()
	game_over.set_death_cause(message)
	game_over.visible = true
