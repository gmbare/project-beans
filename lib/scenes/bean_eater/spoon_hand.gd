extends Node2D

enum orient {left, right}

var curr_orientation : orient = orient.right
var rotations : Dictionary = {
	orient.left : 0.0,
	orient.right : 180
}

var tween : Tween

var win_size : Vector2
var win_bounds : Vector2

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	win_size = DisplayServer.window_get_size()
	win_bounds.x = float(win_size.x / 2)
	win_bounds.y = float(win_size.y / 2)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		position.x += event.relative.x
		position.y += event.relative.y
		position.x = clampf(position.x, 0 ,win_size.x)
		position.y = clampf(position.y, 0 ,win_size.y)
		print(position)
	if event.is_action('left'):
		if curr_orientation == orient.right:
			rotation_degrees = rotations[orient.left]
			curr_orientation = orient.left
	elif event.is_action('right'):
		if curr_orientation == orient.left:
			rotation_degrees = rotations[orient.right]
			curr_orientation = orient.right
