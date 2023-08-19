class_name FlowerWater
extends Flower

const minWater := 0.0
const maxWater := 100.0
var water := 0.3
var maxPerfectWater := 75.0
var minPerfectWater := 25.0
var waterIncrSpeed := 4.0
var waterDecrSpeed := 1.0
var isDrinking := false


func click():
	isDrinking = true

func unclick():
	isDrinking = false

func _on_mouse_exited():
	isDrinking = false

func _process(delta) -> void:
	if isDrinking:
		drinking(delta)
	else:
		not_drinking(delta)
	
	water = clamp(water, minWater, maxWater)
	
	if water < minPerfectWater || water > maxPerfectWater:
		remove_happiness()
	else: # Happiness is juuuuust right
		add_happiness()
	
	if water >= maxWater:
		die("water")

func drinking(delta):
	var amount = 4 * delta
	isDrinking = player.take_water(amount)
	# If there's no more water, isDrinking will be set to false
	water += amount

func not_drinking(delta):
	water -= 1 * delta
