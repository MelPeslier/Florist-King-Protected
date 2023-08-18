extends CanvasLayer

const night = preload("res://shop/night/night_shop.tscn")
const daymusic = preload("res://audio/music/day_shop_start.ogg")


func _ready() -> void:
	visible = true
	$AnimationPlayer.play("RESET")
	
	Music.stop()
	Music.stream = daymusic
	Music.play()
	Music.fade_in()


func _on_continue_pressed():
	get_tree().change_scene_to_packed(night)


func _on_day_timer_timeout():
	
	$DayXCompleted.text = "Day " + str(ScoreManager.get_day()) + " completed!"
	$MoneyLabel.text =  "You have now: " + str(ScoreManager.get_score()) + " €"
	Music.fade_out()
	$AnimationPlayer.play("come_in")
