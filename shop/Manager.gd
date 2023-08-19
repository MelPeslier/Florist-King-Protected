extends Node
var default_scene = preload("res://commons/pot/pot_vide.tscn")
var rooms := []

func _ready():
	var pot_rooms :Array = get_tree().get_nodes_in_group("PotRoom")
	
	for room in pot_rooms:
		for table in room.get_children():
			if table.name == "Table":
				for pot in table.get_children():
					if pot.name.begins_with("Pot"):
						var scene:PackedScene
						if PlacerData.placer_data[room.get_name()][pot.get_name()] == null:
							scene = default_scene
						else :
							scene = load(PlacerData.placer_data[room.get_name()][pot.get_name()].flower_scene)
						var scene_instance = scene.instantiate()
						pot.add_child(scene_instance)
