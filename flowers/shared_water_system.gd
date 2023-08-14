class_name SharedWaterSystem
extends Flower

# Water
var water :float

var min_water :float = 0.0
var max_water :float = 100.0

var min_perfect_water :float
var max_perfect_water :float

# 1.0 is a normal state
var water_decrease_speed :float = 1.0
var water_increase_speed :float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# For animation
func _process(delta):
	pass

# For systems
func _physics_process(delta):
	water -= water_decrease_speed * delta
	
	if water <= min_water or water >= max_water:
		_die_flower()
