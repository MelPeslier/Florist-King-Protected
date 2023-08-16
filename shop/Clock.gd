extends Node2D


####################
# VARIABLES
####################

@export var pivot_seconds_path: Node2D
@export var pivot_minutes_path: Node2D
var radian_seconds = null
var radian_minutes = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	radian_seconds = -Time.get_time_dict_from_system() ["second"] * (PI/30)
	radian_minutes = -Time.get_time_dict_from_system() ["minutes"] * (PI/30) + radian_seconds/60
	
	pivot_seconds_path.set_rot(radian_seconds)
	pivot_minutes_path.set_rot(radian_minutes)
	
