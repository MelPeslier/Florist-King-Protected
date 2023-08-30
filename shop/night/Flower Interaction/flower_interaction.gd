extends Node

@export var main_room: Node2D

func act_around(pot_name: String, action: String) -> Array[Flower]:
	var flowers: Array[Flower] = []
	for pot in main_room.pots:
		var flower = pot.get_child(0)
		if pot.name != pot_name and flower.is_in_group("water_flower"):
				flowers.push_back(flower)
				match action:
					"eat":
						break
					"burn":
						continue
	return flowers
