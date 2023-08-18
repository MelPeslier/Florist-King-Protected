extends Panel


var icon_scene = preload("res://menus/icon.tscn")

var seed_key: String

# Called when the node enters the scene tree for the first time.
func init(key: String, item: Dictionary):
	seed_key = key
	$Name.text = item["flower_name"]
	$Buy.text = "Cost: " + str(item["seed_price"]) + " €"
	$Sell.text = "Sell: " + str(item.flower_price) + " €"
	var icon = icon_scene.instantiate()
	icon.texture = load(item.image)
	icon.set_anchors_preset(PRESET_FULL_RECT)
	$SeedAround/Control.add_child(icon)
	

