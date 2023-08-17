extends TextureRect


@export var image:String
@export var seed_price :float
@export var flower_price :float
@export var flower_name :String
@export var flower_scene :PackedScene


var selected = false


func init(item :Dictionary) -> void:
	image = item["image"]
	texture = load(image)
	seed_price = item["seed_price"]
	flower_price = item["flower_price"]
	flower_name = item["flower_name"]
	flower_scene = load(item["flower_scene"])


func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30, 30)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	
	return texture

func _can_drop_data(at_position, data):
	return data is Texture2D


func _drop_data(at_position, data):
	texture = data


