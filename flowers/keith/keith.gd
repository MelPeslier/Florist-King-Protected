extends FlowerWater

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
	water_decr_speed = 2.5
	water_incr_speed = 30
	
	# Flower
	
	happiness = 1.5
	min_happiness = 0
	max_happiness = 1.5
	happ_decr_speed = 5
	happ_incr_speed = 7
	sell_price = 40
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	Events.manager_end.connect(_on_manager_end)


func _on_manager_end():
	if get_parent():
		neighbors = get_parent().get_parent().check(get_parent().name)
		if neighbors.is_empty():
			happ_decr_speed += alone_coef
		
		for neighbour in neighbors:
			if neighbour == "Keith":
				happ_decr_speed += keith_neighbour_coef
				happ_incr_speed -= keith_neighbour_coef
			else:
				happ_decr_speed -= other_neighbour_coef
				happ_incr_speed += other_neighbour_coef


func not_drinking(delta) -> void:
	# To use the previous code and the one we writte here
	super(delta)
	
	if water > max_perfect_water :
		happiness = max(min_happiness, happiness - happ_decr_speed / 2 * delta)
	elif water < min_perfect_water :
		happiness = max(min_happiness, happiness - happ_decr_speed / 5 * delta)


func die(how :String) -> void:
	super(how)
	
	match how:
		"suicide":
			state_label.text = "has commit suicide"
