class_name FlowerWater
extends Flower

const min_water := 0.0
const max_water := 100.0
var water := 0.3
var max_perfect_water := 75.0
var min_perfect_water := 25.0
var water_incr_speed := 4.0
var water_decr_speed := 1.0
var is_drinking := false


func click():
	is_drinking = true

func unclick():
	is_drinking = false

func _on_mouse_exited():
	is_drinking = false

func _process(delta) -> void:
	if is_drinking:
		drinking(delta)
	else:
		not_drinking(delta)
	
	water = clamp(water, min_water, max_water)
	
	if water < min_perfect_water || water > max_perfect_water:
		remove_happiness()
	else: # Happiness is juuuuust right
		add_happiness()
	
	if water >= max_water:
		die("water")

func drinking(delta):
	var amount = 4 * delta
	is_drinking = player.take_water(amount)
	# If there's no more water, is_drinking will be set to false
	water = min(water + water_incr_speed * delta, max_water)

func not_drinking(delta):
	water = max(water - water_decr_speed * delta, min_water)
