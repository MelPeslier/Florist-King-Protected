class_name Flower
extends Area2D

@onready var flower_room = get_node("../../..").roomNumber # get_parent() 3 times
@onready var player = get_node("../../../../Player") as Player

var happiness := 1.0
var max_happiness := 1.5
var min_happiness := 0.5
var happ_incr_speed := 1.5
var happ_decr_speed := 4.7

var sell_price = 1


func _ready():
	Events.player_enter_room.connect(_on_player_enter_room)
	input_event.connect(_on_input_event)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == 1:
			click()
		elif !event.pressed:
			unclick()


func _on_player_enter_room(_room_number :int):
	interaction()


func add_happiness(amount = happ_incr_speed):
	happiness += amount
	happiness = min(happiness, max_happiness)


func remove_happiness(amount = happ_decr_speed):
	happiness -= amount
	happiness = max(happiness, min_happiness)


func die(how :String):
	pass
#	match how:
#		"burn":
#			create_tween().tween_property($Sprite2D, "modulate:a", 0.0, 0.5)
#		"water":
#			create_tween().tween_property($Sprite2D, "modulate:a", 0.0, 1.0)
#		"eat":
#			create_tween().tween_property($Sprite2D, "modulate:a", 0.0, 0.1)


func sell_flower() -> float:
	return sell_price * happiness


func _on_mouse_entered():
	pass # Abstract function


func _on_mouse_exited():
	pass # Abstract function


func click():
	pass # Abstract function


func unclick():
	pass # Abstract function


func interaction():
	pass # Abstract function
