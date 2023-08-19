extends Node2D

@export var item :Node2D
@onready var tex = $TextureProgressBar


func _process(_delta):
	tex.value = item.water

# To be called after the item initialisation
func update_gauge() -> void:
	# Progress Bar
	tex.min_value = item.min_water
	tex.max_value = item.max_water
	tex.value = item.water
	tex.step = 0.01
