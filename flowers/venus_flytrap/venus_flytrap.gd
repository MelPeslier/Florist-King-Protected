extends FlowerWater

var is_trying_to_eat = false

func _ready() -> void:
	super()
	# Water
	water = 70
	minPerfectWater = 65
	maxPerfectWater = 90
	waterDecrSpeed = 3
	waterIncrSpeed = 11
	
	# Flower
	
	happiness = 1.1
	minHappiness = 0.5
	maxHappiness = 1.5
	happDecrSpeed = 5
	happIncrSpeed = 7
	sell_price = 18
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	
	Events.manager_end.connect(_on_manager_end)


func _on_manager_end():
	if get_parent():
		var neighbors = get_parent().get_parent().check(get_parent().get_name())
		
		for neighbour in neighbors:
			if neighbour == "VenusFlytrap":
				happIncrSpeed = 0
				minHappiness = 0.25
				happiness = 0.25
				$HappinessGauge.update_gauge()
				
			else:
				is_trying_to_eat = true

func not_drinking(delta :float) -> void:
	super(delta)
	
	if happiness <= minHappiness:
		# Animation to eat
		get_parent().get_parent().act_around(get_parent().name, "eat")
		maxHappiness = 3.5
		happiness = 3.5
		$HappinessGauge.update_gauge()
