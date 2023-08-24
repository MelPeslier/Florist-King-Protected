extends Node2D

@export var room_number : int
@export var leftRoom : NodePath
@export var rightRoom : NodePath
@export var upRoom : NodePath
@export var downRoom : NodePath

 
func _ready():
	visible = true


func move(selectedRoom): # Move to a different room
	var player = get_node("../Player")
	if !player.can_move:
		return
	
	selectedRoom = get_node(selectedRoom)
	selectedRoom.enter(player)


func enter(player): # When the player enters the room
	player.just_entered_room(self)




func _on_left_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			move(leftRoom)

func _on_right_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			move(rightRoom)

func _on_up_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			move(upRoom)

func _on_down_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			move(downRoom)

func _on_area_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_area_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

