extends Node

var seeds = {
	"sunflower" : {
		"image" : "res://art/placeholder/seeds/Sunflower_Seeds.png",
		"seed_price" : 1, 
		"flower_price" : 7,
		"flower_name" : "Sunflower", 
		"flower_scene" : "res://flowers/sunflower/sunflower.tscn"
		},
	"celeritas" : {
		"image" : "res://art/placeholder/seeds/Celeritas_Seeds.png",
		"seed_price" : 3, 
		"flower_price" : 16,
		"flower_name" : "Celeritas", 
		"flower_scene" : "res://flowers/celeritas/celeritas.tscn"
		}, 
	"cassandri" : {
		"image" : "res://art/placeholder/seeds/Cassandri_Seeds.png",
		"seed_price" : 7, 
		"flower_price" : 14,
		"flower_name" : "Cassandri", 
		"flower_scene" : "res://flowers/cassandri/cassandri.tscn"
		}, 
	"keith" : {
		"image" : "res://art/placeholder/seeds/Keith_Seeds.png",
		"seed_price" : 12, 
		"flower_price" : 40,
		"flower_name" : "Keith", 
		"flower_scene" : "res://flowers/keith/keith.tscn"
		}, 
	"venus_flytrap" : {
		"image" : "res://art/placeholder/seeds/Venus_Seeds.png",
		"seed_price" : 15, 
		"flower_price" : 18,
		"flower_name" : "Venus Flytrap", 
		"flower_scene" : "res://flowers/venus_flytrap/venus_flytrap.tscn"
		}, 
	"man_eater" : {
		"image" : "res://art/placeholder/seeds/Man_Seeds.png",
		"seed_price" : 20, 
		"flower_price" : 50,
		"flower_name" : "Man Eater", 
		"flower_scene" : "res://flowers/man_eater/man_eater.tscn"
		}, 
	"arsonist" : {
		"image" : "res://art/placeholder/seeds/Arsonist_Seeds.png",
		"seed_price" : 27, 
		"flower_price" : 95,
		"flower_name" : "Arsonist", 
		"flower_scene" : "res://flowers/arsonist/arsonist.tscn"
		},
	"ivy" : {
		"image" : "res://art/placeholder/seeds/Ivy_Seeds.png",
		"seed_price" : 40, 
		"flower_price" : 10,
		"flower_name" : "Ivy", 
		"flower_scene" : "res://flowers/ivy/ivy.tscn"
	}
}


var flowers = {
	"sunflower" : {
		"image" : "res://flowers/sunflower/sprite/sunflower_tmp.jpg",
		"flower_price" : int(7),
		"flower_name" : "Sunflower", 
		"flower_scene" : "res://flowers/sunflower/sunflower.tscn"
		},
	"celeritas" : {
		"image" : "res://flowers/celeritas/sprite/celeritas_tmp.png",
		"flower_price" : 16,
		"flower_name" : "Celeritas", 
		"flower_scene" : "res://flowers/celeritas/celeritas.tscn"
		}, 
	"cassandri" : {
		"image" : "res://flowers/cassandri/sprite/cassandri_tmp.png",
		"flower_price" : 14,
		"flower_name" : "Cassandri", 
		"flower_scene" : "res://flowers/cassandri/cassandri.tscn"
		}, 
	"keith" : {
		"image" : "res://flowers/keith/sprite/keith_tmp.jpg",
		"flower_price" : 40,
		"flower_name" : "Keith", 
		"flower_scene" : "res://flowers/keith/keith.tscn"
		}, 
	"venus_flytrap" : {
		"image" : "res://flowers/venus_flytrap/sprite/venus_flytrap_tmp.png",
		"flower_price" : 18,
		"flower_name" : "Venus Flytrap", 
		"flower_scene" : "res://flowers/venus_flytrap/venus_flytrap.tscn"
		}, 
	"man_eater" : {
		"image" : "res://flowers/man_eater/sprite/man_eater_tmp.png",
		"flower_price" : 50,
		"flower_name" : "Man Eater", 
		"flower_scene" : "res://flowers/man_eater/man_eater.tscn"
		}, 
	"arsonist" : {
		"image" : "res://flowers/arsonist/sprite/arsonist_tmp.png",
		"flower_price" : 95,
		"flower_name" : "Arsonist", 
		"flower_scene" : "res://flowers/arsonist/arsonist.tscn"
		},
	"ivy" : {
		"image" : "res://flowers/ivy/sprite/ivy_tmp.png",
		"flower_price" : 10,
		"flower_name" : "Ivy", 
		"flower_scene" : "res://flowers/ivy/ivy.tscn"
		}
}


#func init(item :Dictionary) -> void:
#	dico = item
#	image = item["image"]
#	texture = load(image)
#	seed_price = item["seed_price"]
#	flower_price = item["flower_price"]
#	flower_name = item["flower_name"]
#	flower_scene = item["flower_scene"]
