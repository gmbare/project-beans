extends Node

var win_size : Vector2

func _ready() -> void:
	win_size = DisplayServer.window_get_size()
