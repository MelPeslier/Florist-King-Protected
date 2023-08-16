extends Node2D

@onready var currentRoom = get_node("../Room10") # Starting room
var canMove := false

func _ready():
	Events.connect("hugging", _on_hugging)
	currentRoom.enter(self)

func just_entered_room(room): # Adjustments when entering
	currentRoom = room
	position = room.position
	canMove = false
	
	# To activate effects in this room and to update position for flowers
	emit_signal("player_enter_room", currentRoom)
	$MoveCooldown.start()



func _on_move_cooldown_timeout():
	canMove = true


func _on_hugging(is_hugging) -> void:
	if is_hugging:
		$MoveCooldown.stop()
		canMove = false
	else:
		canMove = true
