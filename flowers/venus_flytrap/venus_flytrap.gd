extends FlowerWater

var something_to_eat = false

func _ready() -> void:
	super()
	# Water
	water = 70
	min_perfect_water = 65
	max_perfect_water = 90
	water_decr_speed = 3
	water_incr_speed = 11
	
	# Flower
	
	happiness = 1.1
	min_happiness = 0.5
	max_happiness = 1.5
	happ_decr_speed = 5
	happ_incr_speed = 7
	sell_price = 18
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	
	Events.manager_end.connect(_on_manager_end)


func _on_manager_end():
	if get_parent():
		var neighbors = get_parent().get_parent().check(get_parent().get_name())
		
		for neighbour in neighbors:
			if neighbour == "VenusFlytrap":
				happ_incr_speed = 0
				min_happiness = 0.25
				happiness = 0.25
				$HappinessGauge.update_gauge()
				
			elif neighbors != null:
				something_to_eat = true

func not_drinking(delta :float) -> void:
	super(delta)
	
	if something_to_eat and happiness <= min_happiness:
		# Animation to eat
		get_meal()


func get_meal():
	get_parent().get_parent().act_around(get_parent().name, "eat")
	something_to_eat = false
	max_happiness = 3.5
	happiness = 3.5
	$HappinessGauge.update_gauge()
