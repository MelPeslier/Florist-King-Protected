extends Flower

const d := 1920.0
const t := 5.0
var speed := d/t

var the_attack_time := 0.75
var attack_time := the_attack_time

var player_room: int = 0

# Won't move until updated data
var next_room_data := [position, ""]

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	
	# Flower
	happiness = 1.0
	min_happiness = 1.0
	max_happiness = 3.5
	happ_incr_speed = 0.25
	happ_decr_speed = 0.01
	sell_price = 50


func _physics_process(delta):
	state_label.text = "Moving"
	
	if player_room == flower_room.room_number:
		state_label.text = "Attacking player"
		attack_time = max(attack_time - delta, 0.0)
		
		# Eat animation
		
		if attack_time < 0.001 and player_room == flower_room.room_number:
			eat_player()
		
		return
	
	var direction = next_room_data[0] - global_position
	direction = direction.normalized()
	global_position = global_position + direction * speed


func change_room() -> void:
	flower_room = get_node("/root/NightShop/" + next_room_data[1])
	update_next_room()


func update_next_room() -> void:
	var next_room: int = -1
	match flower_room.room_number:
		7:
			if randf() < 0.5:
				next_room = 8
			else:
				next_room = 9
		
		8, 9:
			next_room = 10
		
		10:
			next_room = 2
		
		2: 
			if randf() < 0.5:
				next_room = 5
			else:
				next_room = 4
		
		4, 5:
			next_room = 6
		
		6:
			next_room = 7
	
	if next_room == -1: return
	
	next_room_data = flower_room.update_flower(next_room)


func eat_player() -> void:
	Events.player_death.emit("Yout got eaten\nNext time care about 'Man eater'")
	
	state_label.text = "E A T I N G  Y O U  :3"
	# Eat sound and animation


func _on_player_enter_room(room_number :int) -> void:
	attack_time = the_attack_time
	
	player_room = room_number
	
	var next_room: int = -1
	match flower_room.room_number:
		7:
			match player_room:
				6, 8, 9:
					next_room = player_room
		
		8:
			match player_room:
				7, 9, 10:
					next_room = player_room
		
		9:
			match player_room:
				7, 8, 10:
					next_room = player_room
		
		10:
			match player_room:
				2, 8, 9:
					next_room = player_room
		
		2:
			match player_room:
				4, 5, 10:
					next_room = player_room
		
		4:
			match player_room:
				2, 5, 6:
					next_room = player_room
		
		5:
			match player_room:
				2, 4, 6:
					next_room = player_room
		
		6:
			match player_room:
				4, 5, 7:
					next_room = player_room
		
		_:
			next_room = -1
	
	if next_room != -1:
		happiness = min(happiness + happ_incr_speed, max_happiness)
		next_room_data = flower_room.update_flower(next_room)
		return
	
	happiness = max(happiness - happ_decr_speed, min_happiness)
	update_next_room()
