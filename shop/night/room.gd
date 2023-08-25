extends Node2D


var room_number: int = 0
var nearby_rooms :=[]

@onready var arrow_scene = preload("res://shop/night/Display/arrow.tscn")
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
			
			var arrow = arrow_scene.instantiate()
			add_child(arrow)
			arrow.to_room = nearby_rooms[i][0]
			arrow.position = marker.position
			
			# Rotation
			rotate_to_target(arrow, marker)
			i += 1


func rotate_to_target(dummy, target):
	var direction = target.global_position - global_position
	var angle = direction.angle()
	dummy.rotation = angle


func go_to(room: int) -> void:
	for i in nearby_rooms:
		if i[0] == room:
			var path = i[1]
			move(path)
			break
