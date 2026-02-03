extends Area2D


@export var level: String


func _on_body_entered(_body: Node2D) -> void:
    SceneTransition.change_scene_to(level)
