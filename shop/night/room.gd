extends Node2D

enum Room {
	NUMBER,
	PATH
}
var pots: Array[Node2D]
var room_number: int = 0
var nearby_rooms :=[] 

 
func _ready():
	visible = true


func move(selectedRoom): # Move to a different room
	var player = get_node("../Player")
	if !player.can_move:
		return
	
	# To get absolute path
	selectedRoom = get_node("/root/NightShop/" + str(selectedRoom))
	selectedRoom.enter(player)


func enter(player): # When the player enters the room
	player.just_entered_room(self)


func update_data(room, nearby: Array) -> void:
	# Store data
	room_number = room
	nearby_rooms = nearby
	
	# Update Arrows
	var i: int = 0
	var j: int = 0
	for item in get_children():
		if item is Marker2D:
			# Update to wich room the the marker is pointing for flowers movements
			item.to_room = nearby_rooms[i][0]
			i += 1
			
		# Init movement for flowers
		elif item.is_in_group("pot"):
			pots.append(item)
			if item.get_children().size() > 0:
				if not item.get_child(0).is_in_group("PotVide"):
					item.get_child(0).init_movements()
		
		# Area2D as child of a room must be for input movements
		# Assign to him the room number (will be use to change to room x)
		elif item is Area2D and item.is_in_group("zone"):
			item.to_room = nearby_rooms[j][0]
			print("Room " + str(room) + "zone vers " + str(nearby_rooms[j][0]))
			j += 1
	
	print("Pots dans la chambre" + str(room) + " : " + str(pots))


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


func go_to(room: int) -> void:
	for i in nearby_rooms:
		if i[0] == room:
			var path = i[1]
			move(path)
			break
