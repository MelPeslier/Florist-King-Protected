extends Node

var score: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("sell_seed", _on_sell_seed)
	Events.connect("buy_seed",_on_buy_seed)
	score = 0


func _on_sell_seed(seed_price: float) -> void:
	score += seed_price
	print(score)


func _on_buy_seed(seed_price: float) -> bool:
	if seed_price > score:
		return false
	
	score -= seed_price
	print(score)
	return true
