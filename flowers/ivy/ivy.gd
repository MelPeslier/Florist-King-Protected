extends FlowerWater

var hug_time :float = 0
var min_hug_time :float = 4
var max_hug_time :float = 12 # Only to cap the max money income
var is_hugging :bool = false

var ivy_coef :float = 3

func _ready() -> void:
	super()
		# Water
	water = 33
	minPerfectWater = 12
	maxPerfectWater = 18
	waterDecrSpeed = 2
	waterIncrSpeed = 20
	
	# Flower
	
	happiness = 1.5
	minHappiness = 0.25
	maxHappiness = 1.5
	happDecrSpeed = 21
	happIncrSpeed = 7
	sell_price = 10
	
	$HappinessGauge.update_gauge()
	$WaterGauge.update_gauge()
	Events.manager_end.connect(_on_manager_end)


func _on_manager_end():
	if get_parent():
		var neighbors = get_parent().get_parent().check(get_parent().name)
		
		for neighbour in neighbors:
			if neighbour == "Ivy":
				min_hug_time  *= ivy_coef 

func _physics_process(delta) -> void:
	if isDrinking and not is_hugging:
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
