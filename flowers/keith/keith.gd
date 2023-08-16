extends SharedWaterSystem

@export var keith_neighbour_coef :float = 2.5
@export var alone_coef :float = 1.75

@export var other_neighbour_coef :float = 1.5

var neighbors :Array

func _ready() -> void:
	super()
	# Water
	water = 50
	min_perfect_water = 30
	max_perfect_water = 50
	water_decrease_speed = 2
	water_increase_speed = 4
	
	# Flower
	sprite = $Sprite2D
	happiness = 1.5
	min_happiness = 0
	max_happiness = 1.5
	happiness_decrease_speed = 5
	happiness_increase_speed = 7
	sell_price = 40
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	
	if get_parent():
		neighbors = get_parent().get_parent().check(get_parent().name)
		if neighbors.is_empty():
			happiness_decrease_speed += alone_coef
		
		for neighbour in neighbors:
			if neighbour == "Keith":
				happiness_decrease_speed += keith_neighbour_coef
				happiness_increase_speed -= keith_neighbour_coef
			else:
				happiness_decrease_speed -= other_neighbour_coef
				happiness_increase_speed += other_neighbour_coef

func not_drinking(delta) -> void:
	# To use the previous code and the one we writte here
	super(delta)
	
	if water > max_perfect_water :
		happiness = max(min_happiness, happiness - happiness_decrease_speed / 2 * delta)
	elif water < min_perfect_water :
		happiness = max(min_happiness, happiness - happiness_decrease_speed / 5 * delta)

func die_flower(how :String) -> void:
	super(how)
	
	match how:
		"suicide":
			var tween = create_tween()
