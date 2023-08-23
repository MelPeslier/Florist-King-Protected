class_name Flower
extends Area2D

@onready var flower_room = get_node("../../..").room_number # get_parent() 3 times
@onready var player = get_node("../../../../Player") as Player

var happiness: float
var max_happiness: float
var min_happiness: float
var happ_incr_speed: float
var happ_decr_speed: float

var sell_price: float


# Debug purposes
@onready var state_label = $StateLabel


func _ready():
	Events.player_enter_room.connect(_on_player_enter_room)
	input_event.connect(_on_input_event)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			click()
		elif !event.pressed:
			unclick()


func _physics_process(_delta):
	pass


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
