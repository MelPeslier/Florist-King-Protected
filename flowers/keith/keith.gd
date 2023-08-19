extends FlowerWater

@export var keith_neighbour_coef :float = 2.5
@export var alone_coef :float = 1.75

@export var other_neighbour_coef :float = 1.5

var neighbors :Array

func _ready() -> void:
	super()
	# Water
	water = 50
	minPerfectWater = 30
	maxPerfectWater = 50
	waterDecrSpeed = 2
	waterIncrSpeed = 4
	
	# Flower
	
	happiness = 1.5
	minHappiness = 0
	maxHappiness = 1.5
	happDecrSpeed = 5
	happIncrSpeed = 7
	sell_price = 40
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	Events.manager_end.connect(_on_manager_end)


func _on_manager_end():
	if get_parent():
		neighbors = get_parent().get_parent().check(get_parent().name)
		if neighbors.is_empty():
			happDecrSpeed += alone_coef
		
		for neighbour in neighbors:
			if neighbour == "Keith":
				happDecrSpeed += keith_neighbour_coef
				happIncrSpeed -= keith_neighbour_coef
			else:
				happDecrSpeed -= other_neighbour_coef
				happIncrSpeed += other_neighbour_coef

func not_drinking(delta) -> void:
	# To use the previous code and the one we writte here
	super(delta)
	
	if water > maxPerfectWater :
		happiness = max(minHappiness, happiness - happDecrSpeed / 2 * delta)
	elif water < minPerfectWater :
		happiness = max(minHappiness, happiness - happDecrSpeed / 5 * delta)

func die(how :String) -> void:
	super(how)
	
	match how:
		"suicide":
			var tween = create_tween()
