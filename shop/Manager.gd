extends Node
var default_scene = preload("res://commons/pot/pot_vide.tscn")
var rooms := []

func _ready():
	var pot_rooms :Array = get_tree().get_nodes_in_group("PotRoom")
	
	# Put flowers at seeds places definitively
	for room in pot_rooms:
		for table in room.get_children():
			if table.name == "Table":
				for pot in table.get_children():
					if pot.name.begins_with("Pot"):
						var scene:PackedScene
						if PlacerData.placer_data[room.get_name()][pot.get_name()] == null:
							scene = default_scene
						else :
							# Update data
							var flower_name = PlacerData.placer_data[room.get_name()][pot.get_name()]["flower_name"]
							PlacerData.placer_data[room.get_name()][pot.get_name()] = GameData.flowers[flower_name.to_lower()]
							
							scene = load(PlacerData.placer_data[room.get_name()][pot.get_name()].flower_scene)
						
						# Instantiate flowers
						var scene_instance = scene.instantiate()
						pot.add_child(scene_instance)




func _on_timer_timeout():
	var pot_rooms :Array = get_tree().get_nodes_in_group("PotRoom")
	
	# update flower_prices before going to day
	for room in pot_rooms:
		for table in room.get_children():
			if table.name == "Table":
				for pot in table.get_children():
					if pot.name.begins_with("Pot"):
						var scene:PackedScene
						if PlacerData.placer_data[room.get_name()][pot.get_name()] == null:
							scene = default_scene
						else :
							#access previously instantiated flowers
							var price: float = pot.get_child(0).sell_flower()
							
							PlacerData.placer_data[room.get_name()][pot.get_name()].flower_price = int(price)
						
