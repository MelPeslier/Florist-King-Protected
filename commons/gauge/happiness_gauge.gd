extends Node2D

@onready var flower = get_parent()
@onready var tex = $TextureProgressBar


func _process(_delta):
	tex.value = flower.happiness

# To be called after the flower initialisation
func update_gauge() -> void:
	flower = get_parent()
	tex.min_value = flower.minHappiness
	tex.max_value = flower.maxHappiness
	tex.value = flower.happiness
	tex.step = 0.001
