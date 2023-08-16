extends SharedWaterSystem

var is_escaping :bool = false
var the_travel_time :float = 3
var travel_time :float

func _ready() -> void:
	super()
	# Water
	water = 80
	min_perfect_water = 10
	max_perfect_water = 30
	water_decrease_speed = 3
	water_increase_speed = 7
	
	# Flower
	sprite = $Sprite2D
	happiness = 0.5
	min_happiness = 0.5
	max_happiness = 1.5
	happiness_decrease_speed = 1
	happiness_increase_speed = 3
	sell_price = 16
	
	travel_time = the_travel_time
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()

func _physics_process(delta) -> void:
	if is_drinking and not is_escaping:
		drinking(delta)
	else:
		not_drinking(delta)

func not_drinking(delta) -> void:
	super(delta)
	
	if water == min_water and not is_escaping:
		is_escaping = true
	
	if is_escaping:
		travel_time = max(travel_time -delta, 0)
		
		if travel_time == 0:
			match flower_room:
				4, 5:
					go_to_room(2)
				
				6:
					var val = randf()
					if val < 0.333:
						go_to_room(4)
					elif val < 0.666:
						go_to_room(5)
					else:
						go_to_room(7)
				
				7:
					if randf() < 0.5:
						go_to_room(8)
					else:
						go_to_room(9)
				
				8, 9:
					go_to_room(10)
				
				2:
					go_to_room(10)
				
				10:
					escape()

func go_to_room(number :int) -> void:
	travel_time = the_travel_time
	flower_room = number

# Free Flower + Events related
func escape() -> void:
	pass
