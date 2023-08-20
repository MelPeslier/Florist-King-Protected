class_name Player
extends Node2D

@onready var currentRoom = get_node("../Room10") # Starting room
var canMove := false
var water := 34.0

func _ready():
	Events.hugging.connect(_on_hugging)
	Events.eat_player.connect(_on_eat_player)
	currentRoom.enter(self)

func take_water(amount):
	water = clamp(water-amount, 0, 100)
	if water == 0:
		return false
	return true

func just_entered_room(room): # Adjustments when entering
	currentRoom = room
	position = room.position
	canMove = false
	
	# To activate effects in this room and to update position for flowers
	Events.player_enter_room.emit(currentRoom.roomNumber)
	$MoveCooldown.start()

func _on_move_cooldown_timeout():
	currentRoom.arrows.visible = true
	canMove = true

# Called at the start of hug and at the end of hug
func _on_hugging(is_hugging) -> void:
	if is_hugging:
		$MoveCooldown.stop()
		canMove = false
	else:
		currentRoom.arrows.visible = true
		canMove = true

# Death : End of game
func _on_eat_player():
	pass
