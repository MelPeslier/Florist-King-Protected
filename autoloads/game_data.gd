extends Node



var seeds = {
	"sunflower" : {
		"image" : "res://art/placeholder/seeds/Sunflower_Seeds.png",
		"flower_scene" : "res://flowers/sunflower/sunflower.tscn"
		},
	"celeritas" : {
		"image" : "res://art/placeholder/seeds/Celeritas_Seeds.png",
		"flower_scene" : "res://flowers/celeritas/celeritas.tscn"
		}, 
	"cassandri" : {
		"image" : "res://art/placeholder/seeds/Cassandri_Seeds.png",
		"flower_scene" : "res://flowers/cassandri/cassandri.tscn"
		}, 
	"keith" : {
		"image" : "res://art/placeholder/seeds/Keith_Seeds.png",
		"flower_scene" : "res://flowers/keith/keith.tscn"
		}, 
	"venus_flytrap" : {
		"image" : "res://art/placeholder/seeds/Venus_Seeds.png",
		"flower_scene" : "res://flowers/venus_flytrap/venus_flytrap.tscn"
		}, 
	"man_eater" : {
		"image" : "res://art/placeholder/seeds/Man_Seeds.png",
		"flower_scene" : "res://flowers/man_eater/man_eater.tscn"
		}, 
	"arsonist" : {
		"image" : "res://art/placeholder/seeds/Arsonist_Seeds.png",
		"flower_scene" : "res://flowers/arsonist/arsonist.tscn"
		},
	"ivy" : {
		"image" : "res://art/placeholder/seeds/Ivy_Seeds.png",
		"flower_scene" : "res://flowers/ivy/ivy.tscn"
	}
}


var flowers = {
	"sunflower" : {
		"image" : "res://flowers/sunflower/sprite/sunflower_tmp.jpg",
		"flower_scene" : "res://flowers/sunflower/sunflower.tscn"
		},
	"celeritas" : {
		"image" : "res://flowers/celeritas/sprite/celeritas_tmp.png",
		"flower_scene" : "res://flowers/celeritas/celeritas.tscn"
		}, 
	"cassandri" : {
		"image" : "res://flowers/cassandri/sprite/cassandri_tmp.png",
		"flower_scene" : "res://flowers/cassandri/cassandri.tscn"
		}, 
	"keith" : {
		"image" : "res://flowers/keith/sprite/keith_tmp.jpg",
		"flower_scene" : "res://flowers/keith/keith.tscn"
		}, 
	"venus_flytrap" : {
		"image" : "res://flowers/venus_flytrap/sprite/venus_flytrap_tmp.png",
		"flower_scene" : "res://flowers/venus_flytrap/venus_flytrap.tscn"
		}, 
	"man_eater" : {
		"image" : "res://flowers/man_eater/sprite/man_eater_tmp.png",
		"flower_scene" : "res://flowers/man_eater/man_eater.tscn"
		}, 
	"arsonist" : {
		"image" : "res://flowers/arsonist/sprite/arsonist_tmp.png",
		"flower_scene" : "res://flowers/arsonist/arsonist.tscn"
		},
	"ivy" : {
		"image" : "res://flowers/ivy/sprite/ivy_tmp.png",
		"flower_scene" : "res://flowers/ivy/ivy.tscn"
		}
}


func _init() -> void:
	var paths := [
		"res://ressources/flowers/arsonist_data.tres",
		"res://ressources/flowers/cassandri_data.tres",
		"res://ressources/flowers/celeritas_data.tres",
		"res://ressources/flowers/ivy_data.tres",
		"res://ressources/flowers/keith_data.tres",
		"res://ressources/flowers/man_eater_data.tres",
		"res://ressources/flowers/sunflower_data.tres",
		"res://ressources/flowers/venus_flytrap_data.tres"
	]
	for path in paths:
		var flower_data = load(path)
		var flower_name = flower_data.flower_name.to_snake_case()
		var FlowerName = flower_data.flower_name.to_pascal_case()
		var flower_price = flower_data.flower_price
		var seed_price = flower_data.seed_price
		
		seeds[flower_name]["seed_price"] = seed_price
		seeds[flower_name]["flower_price"] = flower_price
		seeds[flower_name]["flower_name"] = FlowerName
		
		flowers[flower_name]["flower_price"] = flower_price
		flowers[flower_name]["flower_name"] = FlowerName
