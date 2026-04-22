extends Node

@export var background : Polygon2D
@export var falling_beans : GPUParticles2D

@export var spoon_selector : Sprite2D
@export var play_selector : Node2D
@export var settings_selector : Node2D
@export var exit_selector : Node2D
@export var menu_selectors : Node2D

enum Selections {Play, Settings, Exit}

var current_selection : Selections = Selections.Play

func _ready() -> void:
	menu_selectors.position = GM.win_size / 2
	background.polygon[0] = Vector2.ZERO
	background.polygon[1] = Vector2(0.0, GM.win_size.y)
	background.polygon[2] = Vector2(GM.win_size.x, GM.win_size.y)
	background.polygon[3] = Vector2(GM.win_size.x, 0.0)
	print(-GM.win_size.y)
	falling_beans.visible = true
	falling_beans.process_material.emission_box_extents = Vector3(GM.win_size.x, 0.0, 0.0)
	falling_beans.position = Vector2(GM.win_size.x, -100) / 2
	pass


func _on_play_area_mouse_entered() -> void:
	spoon_selector.position = play_selector.position
	spoon_selector.rotation = play_selector.rotation
	current_selection = Selections.Play
	pass # Replace with function body.


func _on_play_area_mouse_exited() -> void:
	pass # Replace with function body.

func _on_settings_mouse_entered() -> void:
	spoon_selector.position = settings_selector.position
	spoon_selector.rotation = settings_selector.rotation
	current_selection = Selections.Settings
	pass # Replace with function body.


func _on_settings_mouse_exited() -> void:
	pass # Replace with function body.

func _on_exit_mouse_entered() -> void:
	spoon_selector.position = exit_selector.position
	spoon_selector.rotation = exit_selector.rotation
	current_selection = Selections.Exit
	pass # Replace with function body.


func _on_exit_mouse_exited() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("left"):
		match current_selection:
			Selections.Play:
				GM.load_scene("uid://b0valyfgge0uc", self)
			Selections.Settings:
				print("Hellow")
			Selections.Exit:
				GM.quit_game()
