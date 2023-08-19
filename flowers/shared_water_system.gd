class_name WaterFlower
extends Flower

const min := 0.0
const max := 100.0
var water := 0.3
var isDrinking := false
@export var minPerfect := 0.25
@export var maxPerfect := 0.75


func click():
	isDrinking = true

func _on_mouse_exited():
	isDrinking = false

func _process(delta) -> void:
	if isDrinking:
		water += 4
	else:
		water += 1
	
	water = clamp(water, min, max)
	
	if water < minPerfect || water > maxPerfect:
		remove_happiness()
	else: # Happiness is just right
		add_happiness()
	
	if water >= max:
		die("water")


