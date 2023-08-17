extends Area2D

@export var image:String
@export var seed_price :float
@export var flower_price :float
@export var flower_name :String
@export var flower_scene :PackedScene

var selected = false

func init(item :Dictionary) -> void:
	image = item["image"]
	$Sprite2D.texture = load(image)
	seed_price = item["seed_price"]
	flower_price = item["flower_price"]
	flower_name = item["flower_name"]
	flower_scene = load(item["flower_scene"])

func _process(delta):
	if selected:
		follow_mouse()

func follow_mouse():
	position = get_global_mouse_position()




func _on_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
