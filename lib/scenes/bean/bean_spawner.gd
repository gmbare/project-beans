extends Node2D

@export var bean_uid : String
var bean_scene : PackedScene


func _ready() -> void:
	bean_scene = load(bean_uid)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_emit_bean()


func _emit_bean() -> void:
		var loaded_scene := bean_scene.instantiate()
		add_child(loaded_scene)
		loaded_scene.position = Vector2(randf_range(0,GM.win_size.x), -5)
