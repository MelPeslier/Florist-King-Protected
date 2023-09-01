extends Timer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$"../UI/Control/Timer/Label".text = str(int(time_left)) + " s"


func _on_timeout():
	$"../UI".visible = false
	print("timeout")
