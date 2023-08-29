extends Marker2D


var to_room: int = -1


func _on_area_2d_area_entered(area):
	area.change_room(to_room)
