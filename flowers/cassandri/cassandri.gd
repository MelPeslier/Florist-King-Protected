extends SharedWaterSystem

var travel_rooms :Array
var is_out :bool = false

var max_money_stole: int = 3
var money_stole :int

var the_travel_time :float = 2.5
var travel_time :float

func _ready() -> void:
	super()
	# Water
	water = 65
	min_perfect_water = 50
	max_perfect_water = 85
	water_decrease_speed = 2.5
	water_increase_speed = 14
	
	# Flower
	sprite = $Sprite2D
	happiness = 0.5
	min_happiness = 0.5
	max_happiness = 1.5
	happiness_decrease_speed = 7
	happiness_increase_speed = 1
	sell_price = 16
	
	travel_time = the_travel_time
	money_stole = 0
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()

func _physics_process(delta) -> void:
	if is_drinking and not is_out:
		drinking(delta)
	else:
		not_drinking(delta)

func not_drinking(delta) -> void:
	super(delta)
	
	if water == min_water and not is_out and money_stole == 0:
		is_out = true
		#leave pot()
	
	if is_out:
		travel_time = max(travel_time - delta, 0)
		if travel_time == 0:
			if money_stole == 0:
					travel_rooms.push_back(flower_room)
					match flower_room:
						4, 5:
							go_to_room(2)
						
						6:
							var val = randf()
							if val < 0.5:
								go_to_room(4)
							else:
								go_to_room(5)
						
						7:
							if randf() < 0.5:
								go_to_room(8)
							else:
								go_to_room(9)
						
						8, 9:
							go_to_room(10)
						
						2:
							go_to_room(1)
						
						10:
							go_to_room(1)
						
						1:
							money_stole = steal(randi_range(1, 3))
							travel_rooms.pop_back()
			else:
				if !travel_rooms.is_empty():
					go_to_room(travel_rooms.back())
					travel_rooms.pop_back()
				else:
					is_out = false
					#enter_pot()

func go_to_room(number :int) -> void:
	travel_time = the_travel_time
	flower_room = number

# Steal + Events related
func steal(amount: int) -> int:
	# Money = Money - amount
	return amount

func sell_flower() -> float:
	return sell_price * happiness * min(float(money_stole), 1)
