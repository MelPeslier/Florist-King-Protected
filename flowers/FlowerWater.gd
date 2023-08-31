class_name FlowerWater
extends Flower

const min_water := 0.0
const max_water := 100.0

var water: float
var max_perfect_water: float
var min_perfect_water: float
var water_incr_speed: float
var water_decr_speed: float

var is_drinking := false


func _ready() -> void:
	water = flower_data.water
	max_perfect_water = flower_data.max_perfect_water
	min_perfect_water = flower_data.min_perfect_water
	water_incr_speed = flower_data.water_incr_speed
	water_decr_speed = flower_data.water_decr_speed


func _physics_process(delta) -> void:
	water_update(delta)
	
	if water <= min_water + 0.01:
		remove_happiness(delta)
	elif water > min_perfect_water and water < max_perfect_water: # Happiness is juuuuust right
		add_happiness(delta)
	
	if water >= max_water - 0.01:
		die("water")


func click():
	is_drinking = true


func unclick():
	is_drinking = false


func _on_mouse_exited():
	is_drinking = false


func water_update(delta: float):
	if is_drinking:
		drinking(delta)
	else:
		not_drinking(delta)


func drinking(delta: float):
	is_drinking = player.take_water(delta)
	if is_drinking:
		water = min(water + water_incr_speed * delta, max_water)
	else: not_drinking(delta)


func not_drinking(delta: float):
	water = max(water - water_decr_speed * delta, min_water)
