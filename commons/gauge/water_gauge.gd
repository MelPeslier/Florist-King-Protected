extends Node2D

@onready var flower = get_parent()
@onready var tex = $TextureProgressBar


func _process(_delta):
	tex.value = flower.water


# To be called after the flower initialisation
func update_gauge() -> void:
	flower = get_parent()
	# Progress Bar
	tex.min_value = flower.minWater
	tex.max_value = flower.maxWater
	tex.value = flower.water
	tex.step = 0.01
	
	# Limits : To put the tresholds at ther right place : -10 because it wasn't perfectly in place
	var sprite_width = tex.texture_over.get_width() -10
	$LowLimit.position.x = flower.minPerfectWater * sprite_width / flower.maxWater - sprite_width / 2
	$HighLimit.position.x = flower.maxPerfectWater * sprite_width / flower.maxWater - sprite_width / 2
