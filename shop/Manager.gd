extends Node

var rooms := []

func _ready():
	var pot_rooms :Array = get_tree().get_nodes_in_group("PotRoom")
	
	for room in pot_rooms:
		var pots := []
		for table in room.get_children():
			if table.name == "Table":
				for pot in table.get_children():
					if pot.name.begins_with("Pot"):
						pots.push_back(pot)
			rooms.push_back(pots)

