class_name Flower
extends Node2D

#Sprite
var sprite: Sprite2D

# Room and Player related
var flower_room :int
var player_room :int

# Happiness
var happiness :float = 1.0
var min_happiness :float = 0.5
var max_happiness :float = 1.5
var happiness_decrease_speed :float = 1.0
var happiness_increase_speed :float = 2.0

# Price
var sell_price :float

func _ready():
	Events.connect("player_enter_room", _on_player_enter_room)
	if get_parent():
		flower_room = get_parent().get_parent().get_parent().roomNumber

func _physics_process(delta) -> void:
	my_input(delta)

func my_input(_delta):
	pass

func _on_player_enter_room(room_number :int) -> void:
	player_room = room_number
	interaction()

func interaction() -> void:
	pass

func sell_flower() -> float:
	return sell_price * happiness

func die_flower(how :String) -> void:
	match how:
		"burn":
			var tween = get_tree().create_tween()
			tween.tween_property(sprite, "modulate:a", 0.0, 0.27)
		
		"water":
			var tween = get_tree().create_tween()
			tween.tween_property(sprite, "modulate:a", 0.0, 1.0)
		
		"eat":
			var tween = get_tree().create_tween()
			tween.tween_property(sprite, "modulate:a", 0.0, 0.1)

func act_around(potName: String, action: String) -> void:
	for pot in get_children():
		if pot.name != potName and pot.get_child_count() == 1:
			pot.get_child(0).die_flower(action)
