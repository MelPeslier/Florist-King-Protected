extends CanvasLayer

const night = preload("res://shop/night/night_shop.tscn")
const daymusicstart = preload("res://audio/music/day_shop_start.ogg")
const daymusicloop = preload("res://audio/music/day_shop_loop.ogg")


signal last_day()


func _ready() -> void:
	visible = true
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
	Music.fade_out()
	if ScoreManager.get_day() < ScoreManager.get_max_day():
		$DayXCompleted.text = "Day " + str(ScoreManager.get_day()) + " completed!"
		$MoneyLabel.text =  "You have : " + str(ScoreManager.get_score()) + " €"
		$AnimationPlayer.play("come_in")
	
	else:
		emit_signal("last_day")
