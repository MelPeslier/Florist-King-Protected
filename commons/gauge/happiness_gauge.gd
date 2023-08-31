extends Node2D

@onready var parent = get_parent()
@onready var tex = $TextureProgressBar


func _process(_delta):
	tex.value = parent.happiness
	
	print(parent.water)

# To be called after the parent initialisation
func update_gauge() -> void:
	print("update gauge")
	parent = get_parent()
	tex.min_value = parent.min_happiness
	tex.max_value = parent.max_happiness
	tex.value = parent.happiness
	tex.step = 0.001
