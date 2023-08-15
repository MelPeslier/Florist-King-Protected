extends Node2D

@onready var currentRoom = get_node("../Room10") # Starting room
var canMove := false

func _ready():
	currentRoom.enter(self)

func just_entered_room(room): # Adjustments when entering
	currentRoom = room
	position = room.position
	canMove = false
	$MoveCooldown.start()



func _on_move_cooldown_timeout():
	canMove = true


