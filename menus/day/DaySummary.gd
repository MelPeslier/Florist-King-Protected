extends CanvasLayer

const night = preload("res://shop/night_shop.tscn")
var money = 0 # Set this value when creating the object

func _ready():
	$DayXCompleted.text = "Day " + str(Global.dayNum) + " completed!"
	$MoneyLabel.text =  "You've earned: " + str(money) + " €"
	Music.fade_out()

func _on_continue_pressed():
	get_tree().change_scene_to_packed(night)
