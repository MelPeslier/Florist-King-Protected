extends Panel


# Called when the node enters the scene tree for the first time.
func init(seed :Area2D):
	$Name.text = seed.flower_name
	$Buy.text = "Cost: " + str(seed.seed_price) + " €"
	$Sell.text = "Sell: " + str(seed.flower_price) + " €"
	$SeedAround.add_child(seed)
	

