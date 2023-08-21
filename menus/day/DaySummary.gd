extends CanvasLayer

const night = preload("res://shop/night/night_shop.tscn")
const daymusicstart = preload("res://audio/music/day_shop_start.ogg")
const daymusicloop = preload("res://audio/music/day_shop_loop.ogg")

@onready var day_x_completed = $Control/HBoxContainer/VBoxContainer/MarginDay/DayXCompleted
@onready var money_label = $Control/HBoxContainer/VBoxContainer/MoneyLabel

signal last_day()


func _ready() -> void:
	visible = false
	$AnimationPlayer.play("RESET")
	
	Music.stream = daymusicstart
	Music.play()
	Music.fade_in()


func _on_continue_pressed():
	get_tree().change_scene_to_packed(night)


func _on_loop_start():
	Music.stream = daymusicloop
	Music.play()


func _on_day_timer_timeout():
	visible = true
	Music.fade_out()
	if ScoreManager.get_day() < ScoreManager.get_max_day():
		day_x_completed.text = "Day " + str(ScoreManager.get_day()) + " completed!"
		money_label.text =  "You have : " + str(ScoreManager.get_score()) + " €"
		$AnimationPlayer.play("come_in")
	
	else:
		emit_signal("last_day")
