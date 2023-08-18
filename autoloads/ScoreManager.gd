extends Node

var score: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0


func sell_seed(seed_price: float) -> void:
	score += seed_price
	print(score)


func buy_seed(seed_price: float) -> bool:
	if seed_price > score:
		return false
	
	score -= seed_price
	print(score)
	return true
