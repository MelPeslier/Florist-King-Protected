extends Area2D

var to_room: int = 0


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			get_parent().go_to(to_room)


func _on_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	if $Sprite2D:
		create_tween().tween_property($Sprite2D, "modulate:a", 0.75, 0.3)
	print("This go to room : " + str(to_room))


func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	if $Sprite2D:
		create_tween().tween_property($Sprite2D, "modulate:a", 1, 0.3)
