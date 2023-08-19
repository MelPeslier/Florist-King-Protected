extends CanvasLayer

const nightMusic = preload("res://audio/music/night_shop_loop.ogg")

func _ready():
	$ColorRect/Label.text = "NIGHT " + str(ScoreManager.get_day())
	visible = true
	Music.stop()
	$Audio.play()


func _on_audio_finished():
	create_tween().tween_property($ColorRect, "modulate", Color.TRANSPARENT, 3)
	$Timer.start()
	Music.stream = nightMusic
	Music.play()
	Music.fade_in()


func _on_timer_timeout():
	queue_free()
