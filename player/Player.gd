####################
# Extend(s)
####################

extends Node2D

####################
# Variable(s)
####################

@onready var currentRoom = get_node("../Room10") # Starting room
var canMove := false

@export var points_to_give = 1
@export var points_to_take = 1
@export var points_cannot_be_more_than: = "None"
@export var points_cannot_be_less_than: = "None"
@export var start_points = 0
@export var default_text = "None"
var points = int(start_points)

@export var allow_conditions = true
var plus_condition = false
var minus_condition = true

####################
# Function(s)
####################

func points_handler():
	if allow_conditions == true:
		if (plus_condition == true and minus_condition == false) or (plus_condition == false and minus_condition == true):
			if plus_condition == true:
				points += int(points_to_give)
				$points_display.text = str(points)
			
			elif minus_condition == true:
				points -= int(points_to_take)
				$points_display.text = str(points)
	
	if not points_cannot_be_more_than == "None":
		if points > int(points_cannot_be_more_than):
			points = int(points_cannot_be_more_than)
			$points_display.text = str(points)
	
	if not points_cannot_be_less_than == "None":
		if points < int(points_cannot_be_less_than):
			points = int(points_cannot_be_less_than)
			$points_display.text = str(points)

func _ready():
	if not default_text == "None":
		$points_display.text = str(default_text)
	
	position = currentRoom.position
	currentRoom.enter()

func _process(_delta):
	# Points handler
	points_handler()
	
	# Movement
	if Input.is_action_just_pressed("ui_left"):
		currentRoom.move(0, self)
	elif Input.is_action_just_pressed("ui_right"):
		currentRoom.move(1, self)
	elif Input.is_action_just_pressed("ui_up"):
		currentRoom.move(2, self)
	elif Input.is_action_just_pressed("ui_down"):
		currentRoom.move(3, self)


func _on_move_cooldown_timeout():
	canMove = true
