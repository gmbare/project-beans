extends Node

@export var main_scene : Node2D

func _ready() -> void:
	main_scene.position = GM.win_size / 2
