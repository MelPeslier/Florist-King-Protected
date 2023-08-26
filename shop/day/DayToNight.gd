extends CanvasLayer

const nightMusic = preload("res://audio/music/night_shop_loop.ogg")
@onready var label = $Control/Label
@onready var background = $Control/Background
@onready var timer = $Timer

func _ready():
	label.text = "NIGHT " + str(ScoreManager.get_day())
	visible = true
	Music.stop()
	$Audio.play()


func _on_audio_finished():
	create_tween().tween_property(background, "modulate", Color.TRANSPARENT, 3)
	timer.start()
	Music.stream = nightMusic
	Music.play()
	Music.fade_in()


func _on_timer_timeout():
	queue_free()
	Pause.canPause = true
