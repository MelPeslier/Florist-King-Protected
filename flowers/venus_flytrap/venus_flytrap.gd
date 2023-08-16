extends SharedWaterSystem

var is_trying_to_eat = false

func _ready() -> void:
	super()
	# Water
	water = 70
	min_perfect_water = 65
	max_perfect_water = 90
	water_decrease_speed = 3
	water_increase_speed = 11
	
	# Flower
	sprite = $Sprite2D
	happiness = 1.1
	min_happiness = 0.5
	max_happiness = 1.5
	happiness_decrease_speed = 5
	happiness_increase_speed = 7
	sell_price = 18
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	
	if get_parent():
		var neighbors = get_parent().get_parent().check(get_parent().name)
		
		for neighbour in neighbors:
			if neighbour == "VenusFlytrap":
				happiness_increase_speed = 0
				min_happiness = 0.25
				happiness = 0.25
				$HappinessGauge.update_gauge()
				
			else:
				is_trying_to_eat = true

func not_drinking(delta :float) -> void:
	super(delta)
	
	if happiness <= min_happiness:
		# Animation to eat
		act_around(get_parent().name, "eat")
		max_happiness = 3.5
		happiness = 3.5
		$HappinessGauge.update_gauge()
