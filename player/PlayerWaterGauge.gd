extends Node2D

@onready var parent = get_parent()
@onready var tex = $TextureProgressBar


func _process(_delta):
	tex.value = parent.water

# To be called after the parent initialisation
func update_gauge() -> void:
	parent = get_parent()
	tex.min_value = parent.min_water
	tex.max_value = parent.max_water
	tex.value = parent.water
	tex.step = 0.01
