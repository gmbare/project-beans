extends Node

var win_size : Vector2

func _ready() -> void:
	win_size = DisplayServer.window_get_size()

func load_scene(new_scene_uid : String, prev_scene : Node) -> void:
	var tmp : Node = load(new_scene_uid).instantiate()
	get_tree().root.add_child(tmp)
	prev_scene.queue_free()

func quit_game() -> void:
	get_tree().quit(0)
