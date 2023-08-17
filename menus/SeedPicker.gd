extends Panel


# Called when the node enters the scene tree for the first time.
func init(my_seed :TextureRect):
	$Name.text = my_seed.flower_name
	$Buy.text = "Cost: " + str(my_seed.seed_price) + " €"
	$Sell.text = "Sell: " + str(my_seed.flower_price) + " €"
	$SeedAround.add_child(my_seed)
	

