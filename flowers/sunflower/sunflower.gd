extends FlowerWater

func _ready() -> void:
	super()
	# Water
	water = 60
	min_perfect_water = 25
	max_perfect_water = 75
	water_decr_speed = 2
	water_incr_speed = 37
	
	# Flower
	happiness = 0.5
	min_happiness = 0.5
	max_happiness = 1.5
	happ_decr_speed = 1
	happ_incr_speed = 2
	
	sell_price = 8
	
	$WaterGauge.update_gauge()
	$HappinessGauge.update_gauge()
