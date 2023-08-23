extends FlowerWater

var travel_rooms := []
var is_out := false

var max_money_stole: int = 3
var money_stole :int = 0
var has_stole := false

var the_travel_time := 2.5
var travel_time := the_travel_time

func _ready() -> void:
	super()
	# Water
	water = 65
	min_perfect_water = 50
	max_perfect_water = 85
	water_decr_speed = 2.5
	water_incr_speed = 35
	
	# Flower
	happiness = 0.5
	min_happiness = 0.5
	max_happiness = 1.5
	happ_decr_speed = 7
	happ_incr_speed = 1
	sell_price = 14
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()


func _physics_process(delta) -> void:
	if is_drinking and not is_out:
		drinking(delta)
	else:
		not_drinking(delta)
	
	# Do none if water > max_perfect_water
	if water < min_perfect_water:
		remove_happiness(delta)
	elif water < max_perfect_water:
		add_happiness(delta)
	
	if water == max_water:
		die("water")

func not_drinking(delta) -> void:
	super(delta)
	
	if water == min_water and not is_out and money_stole == 0:
		is_out = true
		#leave pot()
	
	if is_out:
		travel_time = max(travel_time - delta, 0)
		if travel_time == 0:
			if not has_stole:
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
	global_position


# Steal + Events related
func steal(amount: int) -> int:
	has_stole = true
	if ScoreManager.can_buy_seed(amount):
		ScoreManager.buy_seed(amount)
		return amount
	
	return 0


func sell_flower() -> float:
	return sell_price * happiness * min(float(money_stole), 1)
