extends Node2D

# When clicking on something, will interact with it
var item: Node2D

var min_water :float = 0
var max_water :float = 100

var water :float = 34

var spray :bool = false
var spray_speed :float = 1

var reload :bool = false
var reload_speed :float = 10

func _ready():
	spray = false
	reload = false
	water = 34
	$WateringCanGauge.update_gauge()

func _process(delta):
	pass

func _physics_process(delta):
	# If item on mouse down : all else :false
	
	if water > min_water:
		if item.is_in_group("water_flower"):
			item.watering_can() # To activate water spray to flowers
			spray = true
	
	elif water < max_water:
		if item.is_in_group("faucet"):
			item.watering_can() # To activate water animation from faucet
			reload = true
	
	if reload:
		water = min(water + delta * reload_speed, max_water)
		reload = false
	elif spray:
		water = max(water - delta * spray_speed, min_water)
		spray = false
	
	item = null
