extends CanvasLayer

var paused := false

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		visible = true
		if paused:
			paused = false
			get_tree().paused = false
			Music.fade_in()
		else:
			paused = true
			get_tree().paused = true
			Music.fade_out()
