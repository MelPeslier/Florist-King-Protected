extends Node2D


@export var room_number : int
@onready var arrows = $Arrows


 
func _ready():
	visible = true
	arrows.visible = false


func move(selectedRoom): # Move to a different room
	if !selectedRoom:
		return
	
	var player = get_node("../Player")
	if !player.can_move:
		return
	
	selectedRoom = get_tree().get_root().get_node(selectedRoom)
	arrows.visible = false
	selectedRoom.enter(player)


func enter(player): # When the player enters the room
	player.just_entered_room(self)


func update_data(nearby_rooms: Array) -> void:
	pass


func _on_move_button_pressed(path: NodePath) -> void:
	move(path)
