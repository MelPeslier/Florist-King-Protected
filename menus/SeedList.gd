extends Control

var seed_picker_scene:PackedScene = preload("res://menus/SeedPicker.tscn")
var icon_scene:PackedScene = preload("res://menus/icon.tscn")

var emplacements :Array

# Called when the node enters the scene tree for the first time.
func _ready():
	for key in GameData.seeds.keys():
		var seed_picker = seed_picker_scene.instantiate()
		seed_picker.init(key, GameData.seeds[key])
		$ScrollContainer/VBoxContainer.add_child(seed_picker)
