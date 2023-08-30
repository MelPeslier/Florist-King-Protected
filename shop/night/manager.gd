extends Node

var default_scene = preload("res://commons/pot/pot_vide.tscn")
@export var rooms: Array[Node2D] 

# Start of night
func _ready() -> void:
	for room in rooms:
		for pot in room.pots:
			if PlacerData.placer_data[room.get_name()][pot.get_name()] != null:
				# Update data
				var flower_name = PlacerData.placer_data[room.get_name()][pot.get_name()]["flower_name"]
				PlacerData.placer_data[room.get_name()][pot.get_name()] = GameData.flowers[flower_name.to_snake_case()]
				
				# instantiate flowers
				var scene: PackedScene = load(PlacerData.placer_data[room.get_name()][pot.get_name()].flower_scene)
				var scene_instance = scene.instantiate()
				scene_instance.placer_room = room.get_name()
				scene_instance.placer_pot = pot.get_name()
				pot.add_child(scene_instance)
			
			else :
			# Instantiate empty pots
				var scene: PackedScene = default_scene
				var scene_instance = scene.instantiate()

				
				pot.add_child(scene_instance)

	Events.emit_signal("manager_end")


# end of night
func _on_timer_timeout() -> void:
	var flowers :Array = get_tree().get_nodes_in_group("flower")
	
	for flower in flowers:
		var room = flower.placer_room
		var pot = flower.placer_pot
		var price = flower.sell_flower()
		PlacerData.placer_data[room][pot]["flower_price"] = price
