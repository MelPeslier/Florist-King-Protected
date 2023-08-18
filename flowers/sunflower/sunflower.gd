extends SharedWaterSystem

func _ready() -> void:
	super()
	# Water
	water = 60
	min_perfect_water = 25
	max_perfect_water = 75
	water_decrease_speed = 0.75
	water_increase_speed = 10
	
	# Flower
	sprite = $Sprite2D
	happiness = 0.5
	min_happiness = 0.5
	max_happiness = 1.5
	happiness_decrease_speed = 1
	happiness_increase_speed = 2
	sell_price = 7
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
