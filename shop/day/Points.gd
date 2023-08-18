extends Label

var points : int

func _ready():
	text = str(points)

func add_money(amount):
	points += amount
	text = str(points)

func remove_money(amount):
	points -= amount
	text = str(points)
