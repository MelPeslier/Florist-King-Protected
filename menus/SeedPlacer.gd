extends Control


var icon_scene: PackedScene = preload("res://menus/icon.tscn")
var image_path: String = "res://art/placeholder/pot/cirle.png"

# Called when the node enters the scene tree for the first time.
func _ready():
	for table in get_children():
		if table.is_in_group("table"):
			for pot in get_children():
				var icon = icon_scene.instantiate()
				icon.texture = load(image_path)
				icon.set_anchors_preset(PRESET_FULL_RECT)


