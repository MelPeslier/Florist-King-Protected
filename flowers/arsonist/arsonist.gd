extends FlowerWater


var fire_start_threshold := 30
var fire_burn_nearby_flower_threshold := 10
var fire_coef := 1.0


var normal := 1.0
var burn_self := 0.9
var burn_other := 0.8
var state := normal


func _ready() -> void:
	super()
	# Water
	water = 40
	min_perfect_water = 65
	max_perfect_water = 90
	water_decr_speed = 5
	water_incr_speed = 25.0
	
	# Flower
	happiness = 1.5
	min_happiness = 0.5
	max_happiness = 1.5
	happ_decr_speed = 5
	happ_incr_speed = 7
	sell_price = 95
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	Events.manager.connect(_on_manager_end)


# Check nearby flowers to update data when all flowers have been instantiated
func _on_manager_end():
	if get_parent():
		var neighbors = get_parent().get_parent().check(get_parent().name)
	
		for neighbour in neighbors:
			if neighbour == "Arsonist":
				fire_coef += 0.5


func not_drinking(delta):
	water = max(water - water_decr_speed / state * fire_coef * delta, min_water)
	
	if water > fire_start_threshold:
		state = normal
	
	elif water > fire_burn_nearby_flower_threshold:
		water = max(water - water_decr_speed * fire_coef * delta, min_water)
		
		state = burn_self
	
	elif water > min_water:
		get_parent().get_parent().burn_around(get_parent().name)
		
		state = burn_other
	
	else:
		Events.player_death.emit("You and your shop burned to ashes\n
			Next time, care about 'arsonist'")


func drinking(delta):
	is_drinking = player.take_water(delta)
	# If there's no more water, is_drinking will be set to false
	water = min(water + water_incr_speed * state / fire_coef * delta, max_water)
