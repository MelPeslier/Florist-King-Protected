class_name SharedWaterSystem
extends Flower

# Water
var is_drinking :bool = false

var water :float

const min_water :float = 0.0
const max_water :float = 100.0

var min_perfect_water :float
var max_perfect_water :float

# 1.0 is a normal state
var water_decrease_speed :float = 1.0
var water_increase_speed :float = 4.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# For animation
func _process(delta) -> void:
	pass

# For systems
func _physics_process(delta) -> void:
	if is_drinking:
		drinking(delta)
	else:
		not_drinking(delta)


func not_drinking(delta) -> void:
	
	if water >= max_water:
		die_flower("water")
	
	if water <= min_water :
		happiness = max(happiness - happiness_decrease_speed * delta, min_happiness)
	
	if water >= min_perfect_water and water <= max_perfect_water:
		happiness = min(happiness + happiness_increase_speed * delta, max_happiness)
	
	water_update(delta)

func water_update(delta) -> void:
	water = max(water - water_decrease_speed * delta, min_water) 

func drinking(delta) -> void:
	pass
