extends Node2D

@export var roomNumber : int
@export var leftRoom : NodePath
@export var rightRoom : NodePath
@export var upRoom : NodePath
@export var downRoom : NodePath
@export var fifthRoom : NodePath
@onready var arrows = $Arrows

 
func _ready():
	visible = false
	arrows.visible = false


func move(selectedRoom): # Move to a different room
	if !selectedRoom:
		return
	
	var player = get_node("../Player")
	if !player.canMove:
		return
	
	selectedRoom = get_node(selectedRoom)
	arrows.visible = false
	selectedRoom.enter(player)
	visible = false


func enter(player): # When the player enters the room
	player.just_entered_room(self)
	visible = true




func _on_left_pressed():
	move(leftRoom)


func _on_right_pressed():
	move(rightRoom)


func _on_up_pressed():
	move(upRoom)


func _on_down_pressed():
	move(downRoom)


func _on_direction_5_pressed():
	move(fifthRoom)


