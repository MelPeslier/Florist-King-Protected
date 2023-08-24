extends Node2D

enum Rooms {
	ROOM_1 = 1,
	ROOM_2,
	ROOM_3,
	ROOM_4,
	ROOM_5,
	ROOM_6,
	ROOM_7,
	ROOM_8,
	ROOM_9,
	ROOM_10
}

@export var room_path := []

var path_to := {}

var nearby_rooms := {}

@onready var game_over = $GameOver
@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.player_death.connect(_on_player_death)
	
	# Initialise stored data
	init_dic()
	
	var i = 1
	for room in get_children():
		if room.is_in_group("room"):
			print(nearby_rooms[i])
			room.update_data(nearby_rooms[i])
			i += 1


func _on_player_death(message:String):
	timer.stop()
	game_over.set_death_cause(message)
	game_over.visible = true


func init_dic():
	# Initialise path dictionary
	var i = 1
	for path in room_path:
		path_to[Rooms["ROOM_" + str(i)]] = path
		i += 1
	
	# Initialise nearby_rooms dictionary
	nearby_rooms[Rooms.ROOM_1] = [
		path_to[Rooms.ROOM_2],
		path_to[Rooms.ROOM_10]
	]
	nearby_rooms[Rooms.ROOM_2] = [
		path_to[Rooms.ROOM_1],
		path_to[Rooms.ROOM_3],
		path_to[Rooms.ROOM_4],
		path_to[Rooms.ROOM_5]
	]
	nearby_rooms[Rooms.ROOM_3] = [
		path_to[Rooms.ROOM_2]
	]
	nearby_rooms[Rooms.ROOM_4] = [
		path_to[Rooms.ROOM_2],
		path_to[Rooms.ROOM_5],
		path_to[Rooms.ROOM_6]
	]
	nearby_rooms[Rooms.ROOM_5] = [
		path_to[Rooms.ROOM_2],
		path_to[Rooms.ROOM_4],
		path_to[Rooms.ROOM_6]
	]
	nearby_rooms[Rooms.ROOM_6] = [
		path_to[Rooms.ROOM_4],
		path_to[Rooms.ROOM_5],
		path_to[Rooms.ROOM_7]
	]
	nearby_rooms[Rooms.ROOM_7] = [
		path_to[Rooms.ROOM_6],
		path_to[Rooms.ROOM_8],
		path_to[Rooms.ROOM_9]
	]
	nearby_rooms[Rooms.ROOM_8] = [
		path_to[Rooms.ROOM_7],
		path_to[Rooms.ROOM_9],
		path_to[Rooms.ROOM_10]
	]
	nearby_rooms[Rooms.ROOM_9] = [
		path_to[Rooms.ROOM_7],
		path_to[Rooms.ROOM_8],
		path_to[Rooms.ROOM_10]
	]
	nearby_rooms[Rooms.ROOM_10] = [
		path_to[Rooms.ROOM_1],
		path_to[Rooms.ROOM_2],
		path_to[Rooms.ROOM_8],
		path_to[Rooms.ROOM_9]
	]
