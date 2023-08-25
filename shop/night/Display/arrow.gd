extends TextureButton

const m_o_v = 1.09
const original_scale = Vector2(1.0, 1.0)
const mouse_over_scale = Vector2(m_o_v, m_o_v)

var to_room: int = 0


func _on_mouse_entered():
	scale = mouse_over_scale


func _on_mouse_exited():
	scale = original_scale


func _on_button_up():
	get_parent().go_to(to_room)
