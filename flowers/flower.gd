class_name Flower
extends Area2D

@onready var flower_room = get_node("../../..").roomNumber # get_parent() 3 times
var player_room : int

var happiness := 1.0


func _ready():
	Events.player_enter_room.connect(_on_player_enter_room)
	input_event.connect(_on_input_event)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_player_enter_room(room_number :int):
	player_room = room_number
	interaction()

func add_happiness(amount = 0.15):
	happiness += amount
	happiness = min(happiness, 1.5)

func remove_happiness(amount = 0.07):
	happiness -= amount
	happiness = max(happiness, 0.5)



func die(how :String):
	match how:
		"burn":
			create_tween().tween_property($Sprite, "modulate:a", 0.0, 0.5)
		"water":
			create_tween().tween_property($Sprite, "modulate:a", 0.0, 1.0)
		"eat":
			create_tween().tween_property($Sprite, "modulate:a", 0.0, 0.1)



func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.pressed:
		if event.button_index == 1:
			click()

func _on_mouse_entered():
	pass # Abstract function

func _on_mouse_exited():
	pass # Abstract function

func click():
	pass # Abstract function

func interaction():
	pass # Abstract function

