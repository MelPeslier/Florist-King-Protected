extends FlowerWater

func _ready() -> void:
	super()
	
	$WaterGauge.update_gauge()
	$HappinessGauge.update_gauge()
