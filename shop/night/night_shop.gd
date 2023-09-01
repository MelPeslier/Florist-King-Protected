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

const game_over = preload("res://menus/night/GameOver.tscn")
@onready var timer = $Timer

func _ready():
	Events.player_death.connect(_on_player_death)
	events()
	# Initialise stored data
	init_dic()
	
	var i = 1
	for room in get_children():
		if room.is_in_group("room"):
			room.update_data(i, nearby_rooms[i])
			i += 1


func _on_player_death(message:String):
	timer.stop()
	var death = game_over.instantiate()
	add_child(death)
	death.set_death_cause(message)


# Check for events that happen during specific nights
func events():
	if !Events.broken_lights:
		if ScoreManager.dayNum == 2:
			var blackout = load("res://shop/Blackout.tscn")
			add_child(blackout.instantiate())
	else:
		$Darkness.visible = true
		$Player.use_flashlight()


func init_dic():
	# Initialise path dictionary
	var i = 1
	for path in room_path:
		path_to[Rooms["ROOM_" + str(i)]] = path
		i += 1
	
	# Initialise nearby_rooms dictionary
	nearby_rooms[Rooms.ROOM_1] = [
		[Rooms.ROOM_2, path_to[Rooms.ROOM_2]],
		[Rooms.ROOM_10, path_to[Rooms.ROOM_10]]
	]
	nearby_rooms[Rooms.ROOM_2] = [
		[Rooms.ROOM_1, path_to[Rooms.ROOM_1]],
		[Rooms.ROOM_3, path_to[Rooms.ROOM_3]],
		[Rooms.ROOM_4, path_to[Rooms.ROOM_4]],
		[Rooms.ROOM_10, path_to[Rooms.ROOM_10]]
	]
	nearby_rooms[Rooms.ROOM_3] = [
		[Rooms.ROOM_2, path_to[Rooms.ROOM_2]]
	]
	nearby_rooms[Rooms.ROOM_4] = [
		[Rooms.ROOM_2, path_to[Rooms.ROOM_2]],
		[Rooms.ROOM_5, path_to[Rooms.ROOM_5]],
		[Rooms.ROOM_6, path_to[Rooms.ROOM_6]]
	]
	nearby_rooms[Rooms.ROOM_5] = [
		[Rooms.ROOM_4, path_to[Rooms.ROOM_4]],
		[Rooms.ROOM_6, path_to[Rooms.ROOM_6]]
	]
	nearby_rooms[Rooms.ROOM_6] = [
		[Rooms.ROOM_4, path_to[Rooms.ROOM_4]],
		[Rooms.ROOM_5, path_to[Rooms.ROOM_5]],
		[Rooms.ROOM_7, path_to[Rooms.ROOM_7]]
	]
	nearby_rooms[Rooms.ROOM_7] = [
		[Rooms.ROOM_6, path_to[Rooms.ROOM_6]],
		[Rooms.ROOM_8, path_to[Rooms.ROOM_8]],
		[Rooms.ROOM_9, path_to[Rooms.ROOM_9]]
	]
	nearby_rooms[Rooms.ROOM_8] = [
		[Rooms.ROOM_7, path_to[Rooms.ROOM_7]],
		[Rooms.ROOM_9, path_to[Rooms.ROOM_9]]
	]
	nearby_rooms[Rooms.ROOM_9] = [
		[Rooms.ROOM_7, path_to[Rooms.ROOM_7]],
		[Rooms.ROOM_8, path_to[Rooms.ROOM_8]],
		[Rooms.ROOM_10, path_to[Rooms.ROOM_10]]
	]
	nearby_rooms[Rooms.ROOM_10] = [
		[Rooms.ROOM_1, path_to[Rooms.ROOM_1]],
		[Rooms.ROOM_2, path_to[Rooms.ROOM_2]],
		[Rooms.ROOM_9, path_to[Rooms.ROOM_9]]
	]
