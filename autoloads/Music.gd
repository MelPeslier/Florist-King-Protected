extends AudioStreamPlayer

signal loop_start

func fade_out():
	$AnimationPlayer.play_backwards("fade-in")

func fade_in():
	$AnimationPlayer.play("fade-in")

func _on_finished():
	loop_start.emit()


