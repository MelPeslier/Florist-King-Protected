extends Area2D

var sentence = ""

func lights_out():
	sentence = "I'm not an electrician."


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			get_node("../../Player").talk(sentence)
