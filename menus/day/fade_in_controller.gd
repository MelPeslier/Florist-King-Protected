extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0

func go():
	var tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, ":modulate:a", 1.0, 1.0)
