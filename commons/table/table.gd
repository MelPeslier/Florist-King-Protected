extends Node

func add_flower(flower:Flower, potNumber=null):
	if potNumber:
		match potNumber:
			1:
				$Pot1.add_child(flower)
				return true
			2:
				$Pot2.add_child(flower)
				return true
			3:
				$Pot3.add_child(flower)
				return true
	else: # Just put it in the first available
		if $Pot1.get_child_count() == 0:
			$Pot1.add_child(flower)
			return true
		elif $Pot2.get_child_count() == 0:
			$Pot2.add_child(flower)
			return true
		elif $Pot3.get_child_count() == 0:
			$Pot3.add_child(flower)
			return true
	
	return false # If it's all full


func check(potName :String) -> Array:
	var flowerNames := []
	for pot in get_children():
		if pot.is_in_group("pot"):
			if pot.name != potName:
				for flower in pot.get_children():
					if flower.is_in_group("flower"):
						flowerNames.push_back(pot.flower.name)
	
	return flowerNames


