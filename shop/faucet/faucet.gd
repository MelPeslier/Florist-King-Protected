extends Node2D

var watering = true

func _ready():
	watering = false


func _process(_delta):
	if watering :
		watering = true #to replace
		#Play animation
	watering = false


func watering_can():
	watering = true
