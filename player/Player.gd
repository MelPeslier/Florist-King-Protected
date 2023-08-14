extends Node2D

@onready var currentRoom = get_node("../Room10") # Starting room
var canMove := false

func _ready():
	position = currentRoom.position
	currentRoom.enter()

func _process(_delta):
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
