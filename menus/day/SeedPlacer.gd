extends Control


var icon_scene: PackedScene = preload("res://menus/day/icon.tscn")
var image_path: String = "res://art/placeholder/pot/cirle.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(4, 10):
		var pots := get_tree().get_nodes_in_group("Room" + str(i) + "Pot")
		
		for pot in pots:
			var icon = icon_scene.instantiate()
			icon.set_anchors_preset(PRESET_FULL_RECT)
			
			if PlacerData.placer_data["Room" + str(i)][pot.get_name()] == null:
				icon.texture = load(image_path)
			else:
				icon.texture = load(PlacerData.placer_data["Room" + str(i)][pot.get_name()]["image"])
			
			pot.add_child(icon)


