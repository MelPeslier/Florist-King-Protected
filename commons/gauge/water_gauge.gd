extends Node2D

@onready var parent = get_parent()
@onready var tex = $TextureProgressBar


func _process(_delta):
	tex.value = parent.water


# To be called after the parent initialisation
func update_gauge() -> void:
	parent = get_parent()
	# Progress Bar
	tex.min_value = parent.min_water
	tex.max_value = parent.max_water
	tex.value = parent.water
	tex.step = 0.01
		# Limits : To put the tresholds at ther right place : -10 because it wasn't perfectly in place
	var sprite_width = tex.texture_over.get_width() -10
	$LowLimit.position.x = parent.min_perfect_water * sprite_width / parent.max_water - sprite_width / 2
	$HighLimit.position.x = parent.max_perfect_water * sprite_width / parent.max_water - sprite_width / 2
