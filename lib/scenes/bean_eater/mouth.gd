extends Node2D

@export var closed : Sprite2D
@export var open : Sprite2D


func _ready() -> void:
	open.visible = false
	closed.visible = true

func _on_eating_radius_body_entered(body: Node2D) -> void:
	body.eat()
	close_mouth()
	pass # Replace with function body.

func _on_eating_radius_body_exited(body: Node2D) -> void:
	pass # Replace with function body.


func _on_prepare_radius_body_entered(body: Node2D) -> void:
	open_mouth()
	pass # Replace with function body.


func _on_prepare_radius_body_exited(body: Node2D) -> void:
	close_mouth()
	pass # Replace with function body.


func open_mouth() -> void:
	open.visible = true
	closed.visible = false
	
func close_mouth() -> void:
	open.visible = false
	closed.visible = true
