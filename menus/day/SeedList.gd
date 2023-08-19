extends Control

var seed_picker_scene:PackedScene = preload("res://menus/day/SeedPicker.tscn")
var icon_scene:PackedScene = preload("res://menus/day/icon.tscn")
var sell_scene: PackedScene = preload("res://menus/day/sell_for.tscn")

var emplacements :Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.show_sell_panel.connect(_on_show_sell_panel)
	var icon = icon_scene.instantiate()
	icon.set_anchors_preset(PRESET_FULL_RECT)
	
	var sell = sell_scene.instantiate()
	$sell_seed.add_child(icon)
	$sell_seed.get_child(0).add_child(sell)
	$sell_seed.visible = false
	
	for key in GameData.seeds.keys():
		var seed_picker = seed_picker_scene.instantiate()
		seed_picker.init(GameData.seeds[key])
		$ScrollContainer/VBoxContainer.add_child(seed_picker)


func _on_show_sell_panel(val: bool, price: float) -> void:
	$sell_seed.visible = val
	$sell_seed.get_child(0).get_child(0).text = "Sell for " + str(price) + " €"


func _process(_delta) -> void:
	if Input.is_action_just_released("left_click") and $sell_seed.visible:
		$sell_seed.visible = false
