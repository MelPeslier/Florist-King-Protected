extends Flower

var the_travel_time := 4
var travel_time := the_travel_time
var attack_time := 0.75

var seen_player_room: int = 0

var player_room: int = -1


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	
	# Flower
	
	happiness = 1.0
	min_happiness = 1.0
	max_happiness = 3.5
	sell_price = 50
	
	travel_time = the_travel_time

func _physics_process(delta):
	travel_time = max(travel_time - delta, 0)
	
	if player_room == flower_room:
		attack_time = max(attack_time - delta, 0)
		
		# Eat animation
		
		if attack_time == 0 and player_room == flower_room:
			eat_player()
		return
		
	else:
		attack_time = 0.75
	
	if travel_time == 0 and not player_is_near():
		match flower_room:
			7:
				if randf() < 0.5:
					go_to_room(8)
				else:
					go_to_room(9)
			
			8, 9:
				go_to_room(10)
			
			10:
				go_to_room(2)
			
			2: 
				if randf() < 0.5:
					go_to_room(5)
				else:
					go_to_room(4)
			
			4, 5:
				go_to_room(6)
			
			6:
				go_to_room(7)
	
	else:
		if seen_player_room != 0:
			happiness = min(happiness, happiness + 0.25, max_happiness)
			go_to_room(seen_player_room)

func go_to_room(number :int) -> void:
	travel_time = the_travel_time
	flower_room = number
	# go to a room ? how do we draw flowers ? 
	# they must see if theya re in the room we are then draw them if the case ?
	#what else ?

func eat_player() -> void:
	Events.player_death.emit("Yout got eaten\nNext time care about 'Man eater'")
	
	state_label.text = "E A T I N G  Y O U  :3"
	# Eat sound animation

func player_is_near() -> bool:
	match flower_room:
		7:
			match player_room:
				6, 8, 9:
					seen_player_room = player_room
					return true
		
		8:
			match player_room:
				7, 9, 10:
					seen_player_room = player_room
					return true
		
		9:
			match player_room:
				7, 8, 10:
					seen_player_room = player_room
					return true
		
		10:
			match player_room:
				2, 8, 9:
					seen_player_room = player_room
					return true
		
		2:
			match player_room:
				4, 5, 10:
					seen_player_room = player_room
					return true
		
		4:
			match player_room:
				2, 5, 6:
					seen_player_room = player_room
					return true
		
		5:
			match player_room:
				2, 4, 6:
					seen_player_room = player_room
					return true
		
		6:
			match player_room:
				4, 5, 7:
					seen_player_room = player_room
					return true
		
	return false


func interation():
	player_room = player.current_room.room_number
