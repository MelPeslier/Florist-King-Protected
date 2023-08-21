class_name Player
extends Node2D
@onready var state_label = $StateLabel
@onready var player_water_gauge = $PlayerWaterGauge

@onready var current_room = get_node("../Room10") # Starting room
var can_move := false
var min_water := 0.0
var max_water := 100.0
var water := 34.0

func _ready():
	Events.hugging.connect(_on_hugging)
	current_room.enter(self)
	player_water_gauge.update_gauge()


func take_water(amount):
	if amount < 0 :
		state_label.text = "taking water"
	else:
		state_label.text = "watering the plants"
	
	water = clamp(water - amount, min_water, max_water)
	
	if water == 0:
		state_label.text = "No watter !  Need to replenish at faucet !"
		return false
	return true
	


func just_entered_room(room): # Adjustments when entering
	current_room = room
	position = room.position
	can_move = false
	
	# To activate effects in this room and to update position for flowers
	Events.player_enter_room.emit(current_room.room_number)
	$MoveCooldown.start()


func _on_move_cooldown_timeout():
	current_room.arrows.visible = true
	can_move = true


# Called at the start of hug and at the end of hug
func _on_hugging(is_hugging) -> void:
	if is_hugging:
		$MoveCooldown.stop()
		can_move = false
		state_label.text = "Ivy is giving you a hug, you can't move"
	else:
		state_label.text = ""
		current_room.arrows.visible = true
		can_move = true


