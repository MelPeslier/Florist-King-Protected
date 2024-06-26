extends Node


var room_number: int = 6
var pot_number: int = 3


# First array is a room ( 4 - 5 - 6 - 7 - 8 - 9)
# Second array is a pot ( 1 - 2 - 3)
var placer_data := {}


func reset():
	var flower_number: int = 5 
	var seed_number: int = 2
	for i in range(4, 4 + room_number):
		placer_data["Room" + str(i)] = {}
		for j in range(1, 1 + pot_number):
			if flower_number > 0:
				placer_data["Room" + str(i)]["Pot" + str(j)] = GameData.flowers.sunflower
				flower_number -= 1
			elif seed_number > 0:
				placer_data["Room" + str(i)]["Pot" + str(j)] = GameData.seeds.sunflower
				seed_number -= 1
			else:
				placer_data["Room" + str(i)]["Pot" + str(j)] = null



func check(room: String, pot: String) -> Array:
	var flower_names := []
	var pots_key = placer_data[room].keys()
	
	for pot_key in pots_key:
		if pot_key != pot and placer_data[room][pot_key] != null:
			var flower_name = placer_data[room][pot_key]["flower_name"]
			flower_names.push_back(flower_name)
	
	return flower_names




