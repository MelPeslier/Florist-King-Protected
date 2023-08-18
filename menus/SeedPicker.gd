extends Panel


var icon_scene = preload("res://menus/icon.tscn")

var seed_data: Dictionary

# Called when the node enters the scene tree for the first time.
func init(item: Dictionary):
	seed_data = item
	$Name.text = item["flower_name"]
	$Buy.text = "Cost: " + str(item["seed_price"]) + " €"
	$Sell.text = "Sell: " + str(item.flower_price) + " €"
	var icon = icon_scene.instantiate()
	icon.texture = load(item.image)
	icon.set_anchors_preset(PRESET_FULL_RECT)
	$SeedAround/seed_slot.add_child(icon)
	

