extends Node2D

enum Room {
	NUMBER,
	PATH
}
@export var pots: Array[Node2D]
var room_number: int = 0
var nearby_rooms :=[] 
@onready var arrow_scene = preload("res://shop/night/Display/arrow.tscn")
@onready var arrows = $Arrows

 
func _ready():
	visible = true


func move(selectedRoom): # Move to a different room
	var player = get_node("../Player")
	if !player.can_move:
		return
	
	# To get absolute path
	selectedRoom = get_node("/root/NightShop/" + str(selectedRoom))
	arrows.visible = false
	selectedRoom.enter(player)


func enter(player): # When the player enters the room
	player.just_entered_room(self)


func update_data(room, nearby: Array) -> void:
	# Store data
	room_number = room
	nearby_rooms = nearby
	
	# Update Arrows
	var i: int = 0
	for marker in get_children():
		if marker is Marker2D:
			# Update where to wich room the marker is pointing
			marker.to_room = nearby_rooms[i][0]
			
			# Player Movement Arrows
			var arrow = arrow_scene.instantiate()
			add_child(arrow)
			arrow.to_room = nearby_rooms[i][0]
			arrow.position = marker.position
			
			# Rotation
			rotate_to_target(arrow, marker)
			i += 1
			
		# Init movement for flowers
		elif marker.is_in_group("pot"):
			if not marker.get_child(0).is_in_group("PotVide"):
				marker.get_child(0).init_movements()
			


func rotate_to_target(dummy, target):
	var direction = target.global_position - global_position
	var angle = direction.angle()
	dummy.rotation = angle


func update_flower(target_room: int) -> Array:
	var i: int = 0
	var pos = global_position
	var path = ""
	for marker in get_children():
		if marker is Marker2D:
			if nearby_rooms[i][Room.NUMBER] == target_room:
				pos = marker.global_position
				path = nearby_rooms[i][Room.PATH]
			i += 1
	return [pos, path]
   
   
func _on_left_input_event(_viewport, event, _shape_idx):
#	if event is InputEventMouseButton:
#		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
#			move(leftRoom)
			pass


func _on_right_input_event(_viewport, event, _shape_idx):
#	if event is InputEventMouseButton:
#		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
#			move(rightRoom)
	pass


func _on_up_input_event(_viewport, event, _shape_idx):
#	if event is InputEventMouseButton:
#		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
#			move(upRoom)
	pass


func _on_down_input_event(_viewport, event, _shape_idx):
#	if event is InputEventMouseButton:
#		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
#			move(downRoom)
	pass


func _on_area_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_area_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func go_to(room: int) -> void:
	for i in nearby_rooms:
		if i[0] == room:
			var path = i[1]
			move(path)
			break
