extends Node2D

var min_water :float = 0
var max_water :float = 100

var water :float = 34

var spray_speed :float = 1

var reload_speed :float = 10

func _ready():
	water = 34
	$WateringCanGauge.update_gauge()

func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed("left_click"):
		var mouse_position = get_global_mouse_position()
		var mouse_over_objects = get_world_2d().get_interactive_objects(mouse_position)
		
		if mouse_over_objects.size() > 0:
			var hovered_object = mouse_over_objects[0]
			
			if hovered_object.is_in_group("water_flower"):
				if water > min_water:
					hovered_object.watering_can() # To activate water spray to flowers
					water = max(water - delta * spray_speed, min_water)
				
			elif hovered_object.is_in_group("faucet"):
				if water < max_water:
					water = min( water + delta * reload_speed, max_water)
					hovered_object.watering_can() # To activate water animation from faucet
			$WateringCanGauge.update_gauge()
