extends Control

var seed_picker_scene:PackedScene = preload("res://menus/SeedPicker.tscn")
var icon_scene:PackedScene = preload("res://menus/icon.tscn")
var sell_scene: PackedScene = preload("res://menus/sell_for.tscn")

var emplacements :Array

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("show_sell_panel", _on_show_sell_panel)
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


func _on_show_sell_panel(val: bool):
	$sell_seed.visible = val


func _process(_delta):
	if Input.is_action_just_released("left_click") and $sell_seed.visible:
		$sell_seed.visible = false
