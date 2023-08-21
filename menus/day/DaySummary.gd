extends CanvasLayer

const night_path: String = "res://shop/night/night_shop.tscn"
const daymusicstart = preload("res://audio/music/day_shop_start.ogg")
const daymusicloop = preload("res://audio/music/day_shop_loop.ogg")

@onready var recap_template = $RecapTemplate
@onready var animation_player = $AnimationPlayer


signal last_day()


func _ready() -> void:
	visible = false
	animation_player.play("RESET")
	
	Music.stream = daymusicstart
	Music.play()
	Music.fade_in()


func _on_loop_start():
	Music.stream = daymusicloop
	Music.play()


func _on_day_timer_timeout():
	visible = true
	Music.fade_out()
	if ScoreManager.get_day() < ScoreManager.get_max_day():
		recap_template.initialise(
			"Day " + str(ScoreManager.get_day()) + " completed!",
			"You have : " + str(ScoreManager.get_score()) + " €",
			night_path
		)
		animation_player.play("come_in")
	else:
		emit_signal("last_day")
