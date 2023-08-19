extends Timer

func _process(_delta):
	$"../CanvasLayer/Time/Label".text = str(int(time_left)) + " s"
