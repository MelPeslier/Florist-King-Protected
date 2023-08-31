class_name Flower
extends Area2D


@export var flower_data: FlowerData

var happiness: float
var max_happiness: float
var min_happiness: float
var happ_incr_speed: float
var happ_decr_speed: float

var sell_price: float

var placer_room: String
var placer_pot: String

@onready var flower_room = get_node("../../..") # get_parent() 3 times
@onready var player = get_node("../../../Player") as Player
# Debug purposes
@onready var state_label = $StateLabel


func _ready():
	Events.player_enter_room.connect(_on_player_enter_room)
	input_event.connect(_on_input_event)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	happiness = flower_data.happiness
	max_happiness = flower_data.max_happiness
	min_happiness = flower_data.min_happiness
	happ_incr_speed = flower_data.happ_incr_speed
	happ_decr_speed = flower_data.happ_decr_speed
	sell_price = flower_data.flower_price


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			click()
		elif !event.pressed:
			unclick()


func _on_player_enter_room(_room_number :int):
	pass


func add_happiness(delta: float):
	happiness = min(happiness + happ_incr_speed * delta, max_happiness)


func remove_happiness(delta: float):
	happiness = max(happiness - happ_decr_speed * delta, min_happiness)


func die(how :String):
	var timer = Timer.new()
	timer.set_one_shot(true)
	add_child(timer)
	timer.start(4.0)
	
	match how:
		"burn":
			state_label.text = "burning"
		"water":
			state_label.text = "drowning"
		"eat":
			state_label.text = "getting eaten"
	
	await timer.timeout
	queue_free()


func init_movements() -> void:
	pass


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
