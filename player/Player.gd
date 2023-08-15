extends Node2D

@onready var currentRoom = get_node("../Room10") # Starting room
var canMove := false

func _ready():
	position = currentRoom.position
	currentRoom.enter()


func _on_move_cooldown_timeout():
	canMove = true
