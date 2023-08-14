class_name Flower
extends Node2D

#Sprite
@export var sprite: Sprite2D

# Happiness
var happiness :float = 1.0
var happiness_min :float = 0.5
var happiness_max :float = 1.5

# Price
var sell_price :float

func _sell_flower() -> float:
	return sell_price * happiness

func _die_flower() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(sprite, "modulate:a", 0.0, 1.0)
	queue_free()
