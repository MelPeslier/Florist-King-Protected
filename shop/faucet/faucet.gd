extends Area2D

@onready var player = get_node("../../Player") as Player
var running := false


func _on_mouse_exited():
	running = false


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == 1:
			running = true
		elif !event.pressed:
			running = false


func _process(delta):
	if running:
		running = player.take_water(-delta)
