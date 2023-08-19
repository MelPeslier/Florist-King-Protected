extends Node

signal update_score(score: float)

var score: float = 0

var dayNum := 1 # From 1 to 6

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0


func sell_seed(seed_price: float) -> void:
	score += seed_price
	emit_signal("update_score", score)


func can_buy_seed(seed_price: float) -> bool:
	if seed_price > score:
		return false
	return true


func buy_seed(seed_price: float) -> void:
	score -= seed_price
	emit_signal("update_score", score)


func get_score():
	return score


func next_day():
	dayNum += 1


func get_day():
	return dayNum
