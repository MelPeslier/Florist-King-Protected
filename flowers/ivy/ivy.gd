extends SharedWaterSystem

var hug_time :float = 0
var min_hug_time :float = 4
var max_hug_time :float = 12 # Only to cap the max money income
var is_hugging :bool = false

var ivy_coef :float = 3

func _ready() -> void:
	super()
		# Water
	water = 33
	min_perfect_water = 12
	max_perfect_water = 18
	water_decrease_speed = 2
	water_increase_speed = 20
	
	# Flower
	sprite = $Sprite2D
	happiness = 1.5
	min_happiness = 0.25
	max_happiness = 1.5
	happiness_decrease_speed = 21
	happiness_increase_speed = 7
	sell_price = 10
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	Events.connect("manager_end", _on_manager_end)


func _on_manager_end():
	if get_parent():
		var neighbors = get_parent().get_parent().check(get_parent().name)
		
		for neighbour in neighbors:
			if neighbour == "Ivy":
				min_hug_time  *= ivy_coef 

func _physics_process(delta) -> void:
	if is_drinking and not is_hugging:
		drinking(delta)
	else:
		not_drinking(delta)

func not_drinking(delta):
	super(delta)
	
	if is_hugging:
		hug_time += delta
		if hug_time >= min_hug_time:
			Events.emmit("hugging", false)
			is_hugging = false

func interacttion() -> void:
	if hug_time <= 0 :
		Events.emmit("hugging", true)
		is_hugging = true

func sell_flower() -> float:
	return sell_price * happiness * clamp(hug_time, 1, max_hug_time)
