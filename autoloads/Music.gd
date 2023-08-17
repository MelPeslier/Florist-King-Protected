extends AudioStreamPlayer


func fade_out():
	create_tween().tween_property(self, "volume_db", linear_to_db(0), 2)

func fade_in():
	create_tween().tween_property(self, "volume_db", linear_to_db(1), 2)
