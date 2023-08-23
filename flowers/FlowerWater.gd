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


func click():
	is_drinking = true


func unclick():
	is_drinking = false


func _on_mouse_exited():
	is_drinking = false


func _physics_process(delta) -> void:
	super(delta)
	print("enter_physic process")
	water_update(delta)
	
	if water <= min_water + 0.01:
		remove_happiness(delta)
	elif water > min_perfect_water and water < max_perfect_water: # Happiness is juuuuust right
		add_happiness(delta)
	
	if water >= max_water - 0.01:
		die("water")


func water_update(delta: float):
	if is_drinking:
		drinking(delta)
	else:
		print("enter wawter_update")
		not_drinking(delta)


func drinking(delta: float):
	water = min(water + water_incr_speed * delta, max_water)
	is_drinking = player.take_water(delta)


func not_drinking(delta: float):
	print("laa")
	water = max(water - water_decr_speed * delta, min_water)
