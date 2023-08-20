extends FlowerWater

func _ready() -> void:
	super()
	# Water
	water = 60
	minPerfectWater = 25
	maxPerfectWater = 75
	waterDecrSpeed = 0.75
	waterIncrSpeed = 10
	
	# Flower
	happiness = 0.5
	minHappiness = 0.5
	maxHappiness = 1.5
	happDecrSpeed = 1
	happIncrSpeed = 2

