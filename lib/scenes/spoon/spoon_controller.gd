extends CharacterBody2D

enum orient {left, right}

var curr_orientation : orient = orient.left
var rot_angles : Dictionary = {
	'left' : 0.0,
	'right' : 200
}
@export var bump_angle : float = 75
@export var bump_duration : float = 0.1
@export var bump_reset : float = 0.1
var is_taking_action : bool
@export var flip_duration : float = 0.25

var tween : Tween
@export var anim_player : AnimationPlayer

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	flip(rot_angles.left)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		position.x += event.relative.x
		position.y += event.relative.y
		position.x = clampf(position.x, 0 ,GM.win_size.x)
		position.y = clampf(position.y, 0 ,GM.win_size.y)
	if event.is_action('left'):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		if rotation_degrees <= 90:
			bump(rot_angles.left)
		else:
			flip(rot_angles.left)
	elif event.is_action('right'):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		if rotation_degrees >= 90:
			bump(rot_angles.right)
		else:
			flip(rot_angles.right)

func bump(return_pos : float) -> void:
	if not is_taking_action:
		is_taking_action = true
		if tween:
			tween.kill()
		tween = create_tween()
		var actual_bump : float = abs(return_pos - bump_angle)
		var dur_target : float = (abs(bump_angle - rotation_degrees) / max(rot_angles.left, rot_angles.right)) * flip_duration
		tween.tween_property(self, 'rotation_degrees', actual_bump, dur_target)
		tween.tween_property(self, 'rotation_degrees', return_pos, bump_reset)
		tween.tween_callback(func(): is_taking_action = false)
		
func flip(target_pos : float) -> void:
	if not is_taking_action:
		is_taking_action = true
		if tween:
			tween.kill()
		tween = create_tween()
		var dur_target : float = (abs(target_pos - rotation_degrees) / max(rot_angles.left, rot_angles.right)) * flip_duration
		tween.tween_property(self, 'rotation_degrees', target_pos, dur_target)
		tween.tween_callback(func(): is_taking_action = false)
