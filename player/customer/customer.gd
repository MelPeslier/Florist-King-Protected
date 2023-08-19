extends Control

@onready var sell_scene = preload("res://player/customer/sell_flower_for.tscn")
@onready var icon_scene = preload("res://menus/day/icon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("show_sell_flower_panel", _on_show_sell_flower_panel)
	var icon = icon_scene.instantiate()
	icon.set_anchors_preset(PRESET_FULL_RECT)
	
	var sell = sell_scene.instantiate()
	$sell_flower.add_child(icon)
	$sell_flower.get_child(0).add_child(sell)
	$sell_flower.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("left_click") and $sell_flower.visible:
		$sell_flower.visible = true


func _on_show_sell_flower_panel(val: bool, price: float) -> void:
	$sell_flower.visible = val
	$sell_flower.get_child(0).get_child(0).text = "Sell for " + str(price) + " €"

