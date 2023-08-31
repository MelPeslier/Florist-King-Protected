extends FlowerWater

var something_to_eat := false

func _ready() -> void:
	super()
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	
	Events.manager_end.connect(_on_manager_end)


func _on_manager_end():
	if get_parent():
		var neighbors = get_parent().get_parent().check(get_parent().get_name())
		
		for neighbour in neighbors:
			if neighbour == "VenusFlytrap":
				happ_incr_speed = 0
				min_happiness = 0.25
				happiness = 0.25
				$HappinessGauge.update_gauge()
				
			elif neighbors != null:
				something_to_eat = true


func remove_happiness(delta: float):
	super(delta)
	if something_to_eat and happiness == min_happiness:
		# Animation to eat
		get_meal()

func get_meal():
	var nearby_flowers: Array[Flower] = get_node("../../FlowerInterction").act_around(get_parent().name, "eat")
	
	#Lancement de l'attaque
	something_to_eat = false
	max_happiness = 3.5
	happiness = 3.5
	$HappinessGauge.update_gauge()
	
	state_label = "have eaten"
