extends Marker2D



func _on_area_2d_area_entered(area):
	area.change_room()