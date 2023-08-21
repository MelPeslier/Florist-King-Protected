class_name Flower
extends Area2D

@onready var flower_room = get_node("../../..").room_number # get_parent() 3 times
@onready var player = get_node("../../../../Player") as Player

var happiness := 1.0
var max_happiness := 1.5
var min_happiness := 0.5
var happ_incr_speed := 1.5
var happ_decr_speed := 4.7

var sell_price = 1


# Debug purposes
@onready var state_label = $StateLabel

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


func add_happiness():
	happiness = min(happiness + happ_incr_speed * delta, max_happiness)
	happiness = min(happiness, max_happiness)


func remove_happiness():
	happiness = max(happiness)


func die(how :String):
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.start(4.0)
	await timer.timeout
	queue_free()
	
	match how:
		"burn":
			state_label.text = "burning"
		"water":
			state_label.text = "drowning"
		"eat":
			state_label.text = "getting eaten"


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
