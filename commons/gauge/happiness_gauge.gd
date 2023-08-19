extends Node2D

@export var flower :Flower
@onready var tex = $TextureProgressBar


func _process(_delta):
	tex.value = flower.happiness

# To be called after the flower initialisation
func update_gauge() -> void:
	flower = get_parent()
	tex.min_value = flower.min_happiness
	tex.max_value = flower.max_happiness
	tex.value = flower.happiness
	tex.step = 0.001
