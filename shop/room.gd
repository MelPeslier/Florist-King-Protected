extends Node2D

@export var roomNumber : int
@export var leftRoom : NodePath
@export var rightRoom : NodePath
@export var upRoom : NodePath
@export var downRoom : NodePath
@export var minimapPos := Vector2.ZERO


func move(direction, player):
	if !player.canMove:
		return
	
	var selectedRoom
	match direction:
		0:
			if leftRoom:
				selectedRoom = leftRoom
		1:
			if rightRoom:
				selectedRoom = rightRoom
		2:
			if upRoom:
				selectedRoom = upRoom
		3:
			if downRoom:
				selectedRoom = downRoom
	
	if selectedRoom:
		selectedRoom = get_node(selectedRoom)
		player.currentRoom = selectedRoom
		player.position = selectedRoom.position
		player.canMove = false
		player.get_node("MoveCooldown").start()
		selectedRoom.enter()
	

func enter(): # Do stuff as soon as the player enters
	get_node("../Player").set_minimap_arrows(minimapPos, !leftRoom.is_empty(), !rightRoom.is_empty(), !upRoom.is_empty(), !downRoom.is_empty())
	

