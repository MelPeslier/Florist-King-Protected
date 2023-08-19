extends FlowerWater

var is_escaping :bool = false
var the_travel_time :float = 3
var travel_time :float

func _ready() -> void:
	super()
	# Water
	water = 80
	minPerfectWater = 10
	maxPerfectWater = 30
	waterDecrSpeed = 3
	waterIncrSpeed = 7
	
	# Flower
	
	happiness = 0.5
	minHappiness = 0.5
	maxHappiness = 1.5
	happDecrSpeed = 1
	happIncrSpeed = 3
	sell_price = 16
	
	travel_time = the_travel_time
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()

func _physics_process(delta) -> void:
	if isDrinking and not is_escaping:
		drinking(delta)
	else:
		not_drinking(delta)

func not_drinking(delta) -> void:
	super(delta)
	
	if water == minWater and not is_escaping:
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
