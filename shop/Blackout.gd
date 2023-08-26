extends CanvasLayer

var first_message_done := false
@onready var player = get_node("../Player")

func _on_start_timer_timeout():
	get_node("../Room3/ElectricalCabinet").lights_out()
	get_node("../Darkness").visible = true
	$Thunder.play()
	Events.broken_lights = true
	$Timer.start()

func _on_timer_timeout():
	if !first_message_done:
		player.talk("What the hell?!")
		first_message_done = true
		$Timer.start()
	else:
		$Flashlight.play()
		player.talk("I'll have to use my flashlight.")
		player.use_flashlight()


func _on_audio_finished():
	queue_free()


