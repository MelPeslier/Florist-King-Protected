extends FlowerWater

signal burn_shop

var fire_start_threshold :float = 30
var fire_burn_nearby_flower_threshold :float = 10
var fire_coef :float = 1

var normal_plus :float = 3
var burn_self_plus :float = 2.25
var burn_flowers_plus :float = 1.5

func _ready() -> void:
	super()
	# Water
	water = 40
	minPerfectWater = 65
	maxPerfectWater = 90
	waterDecrSpeed = 5
	waterIncrSpeed = normal_plus
	
	# Flower
	
	happiness = 1.5
	minHappiness = 0.5
	maxHappiness = 1.5
	happDecrSpeed = 5
	happIncrSpeed = 7
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
			
			if water <= minWater:
				burning("shop")

func water_update(delta) -> void:
	if isDrinking:
		water = min(water + waterIncrSpeed / fire_coef * delta, maxWater)
	else:
		water = max(water - waterDecrSpeed * fire_coef * delta, minWater)

func burning(val :String) -> void:
	match val:
		"false":
			waterIncrSpeed = normal_plus / fire_coef
		
		"self":
			waterIncrSpeed = burn_self_plus  / fire_coef
		
		"flowers":
			waterIncrSpeed = burn_flowers_plus / fire_coef
			if get_parent():
				get_parent().get_parent().burn_around(get_parent().name)
		
		"shop":
			burn_shop.emit()

