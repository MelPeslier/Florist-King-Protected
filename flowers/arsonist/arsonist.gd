extends FlowerWater


var fire_start_threshold :float = 30
var fire_burn_nearby_flower_threshold :float = 10
var fire_coef :float = 1

var normal_plus :float = 25
var burn_self_plus :float = 2.25
var burn_flowers_plus :float = 1.5


func _ready() -> void:
	super()
	# Water
	water = 40
	min_perfect_water = 65
	max_perfect_water = 90
	water_decr_speed = 5
	water_incr_speed = normal_plus
	
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


func _on_manager_end():
	if get_parent():
		var neighbors = get_parent().get_parent().check(get_parent().name)
	
		for neighbour in neighbors:
			if neighbour == "Arsonist":
				fire_coef += 1


func not_drinking(delta):
	super(delta)
	if water > fire_start_threshold:
		burning("false")
	else:
		burning("self")
		
		if water < fire_burn_nearby_flower_threshold:
			burning("flowers")
			
			if water <= min_water:
				burning("shop")


func water_update(delta) -> void:
	if is_drinking:
		water = min(water + water_incr_speed / fire_coef * delta, max_water)
	else:
		water = max(water - water_decr_speed * fire_coef * delta, min_water)


func burning(val :String) -> void:
	match val:
		"false":
			water_incr_speed = normal_plus / fire_coef
		
		"self":
			water_decr_speed = burn_self_plus  / fire_coef
		
		"flowers":
			water_incr_speed = burn_flowers_plus / fire_coef
			if get_parent():
				get_parent().get_parent().burn_around(get_parent().name)
		
		"shop":
			Events.player_death.emit("You got Burned\nNext time, care about 'arsonist'")

