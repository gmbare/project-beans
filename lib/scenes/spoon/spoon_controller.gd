extends CharacterBody2D

enum orient {left, right}

var curr_orientation : orient = orient.left
var rotations : Dictionary = {
	orient.left : 0.0,
	orient.right : 180
}

var tween : Tween
@export var anim_player : AnimationPlayer

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		position.x += event.relative.x
		position.y += event.relative.y
		position.x = clampf(position.x, 0 ,GM.win_size.x)
		position.y = clampf(position.y, 0 ,GM.win_size.y)
		print(position)
	if event.is_action('left'):
		if curr_orientation == orient.right:
			if anim_player.is_playing():
				anim_player.stop()
			anim_player.play('flip_spoon',-1,-1.0,true)
			curr_orientation = orient.left
	elif event.is_action('right'):
		if curr_orientation == orient.left:
			if anim_player.is_playing():
				anim_player.stop()
			anim_player.play('flip_spoon',-1,1.0,false)
			curr_orientation = orient.right
