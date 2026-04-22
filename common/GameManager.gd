extends Node

var win_size : Vector2
var is_paused : bool = false
var curr_scene : Node

func _ready() -> void:
	win_size = DisplayServer.window_get_size()

func load_new_scene(new_scene_uid : String) -> void:
	var tmp : Node = load(new_scene_uid).instantiate()
	get_tree().root.add_child(tmp)
	curr_scene.queue_free()
	curr_scene = tmp

func quit_game() -> void:
	get_tree().quit(0)

#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("left"):
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
