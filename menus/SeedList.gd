extends Control

var seed_picker_scene:PackedScene = preload("res://menus/SeedPicker.tscn")
var seed_scene:PackedScene = preload("res://menus/seed.tscn")

var arsonist = {
	"image" : "res://art/placeholder/seeds/Arsonist_Seeds.png",
	"seed_price" : 27, 
	"flower_price" : 95,
	"flower_name" : "Arsonist", 
	"flower_scene" : "res://flowers/arsonist/arsonist.tscn"
}

var cassandri = {
	"image" : "res://art/placeholder/seeds/Cassandri_Seeds.png",
	"seed_price" : 7, 
	"flower_price" : 14,
	"flower_name" : "Cassandri", 
	"flower_scene" : "res://flowers/cassandri/cassandri.tscn"
}

var celeritas = {
	"image" : "res://art/placeholder/seeds/Celeritas_Seeds.png",
	"seed_price" : 3, 
	"flower_price" : 16,
	"flower_name" : "Celeritas", 
	"flower_scene" : "res://flowers/celeritas/celeritas.tscn"
}

var ivy = {
	"image" : "res://art/placeholder/seeds/Ivy_Seeds.png",
	"seed_price" : 40, 
	"flower_price" : 10,
	"flower_name" : "Ivy", 
	"flower_scene" : "res://flowers/ivy/ivy.tscn"
}

var keith = {
	"image" : "res://art/placeholder/seeds/Keith_Seeds.png",
	"seed_price" : 12, 
	"flower_price" : 40,
	"flower_name" : "Keith", 
	"flower_scene" : "res://flowers/keith/keith.tscn"
}

var man_eater = {
	"image" : "res://art/placeholder/seeds/Man_Seeds.png",
	"seed_price" : 20, 
	"flower_price" : 50,
	"flower_name" : "Man Eater", 
	"flower_scene" : "res://flowers/man_eater/man_eater.tscn"
}

var sunflower = {
	"image" : "res://art/placeholder/seeds/Sunflower_Seeds.png",
	"seed_price" : 1, 
	"flower_price" : 7,
	"flower_name" : "Sunflower", 
	"flower_scene" : "res://flowers/sunflower/sunflower.tscn"
}

var venus_flytrap = {
	"image" : "res://art/placeholder/seeds/Venus_Seeds.png",
	"seed_price" : 15, 
	"flower_price" : 18,
	"flower_name" : "Venus Flytrap", 
	"flower_scene" : "res://flowers/venus_flytrap/venus_flytrap.tscn"
}


# Called when the node enters the scene tree for the first time.
func _ready():
	var seeds_array:Array =[sunflower,
			celeritas, 
			cassandri, 
			keith, 
			venus_flytrap, 
			man_eater, 
			arsonist,
			ivy]
	
	for item in seeds_array:
		var seed_picker = seed_picker_scene.instantiate()
		var my_seed = seed_scene.instantiate()
		my_seed.init(item)
		seed_picker.init(my_seed)
		$ScrollContainer/VBoxContainer.add_child(seed_picker)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
