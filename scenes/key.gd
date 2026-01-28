extends Area2D


@onready var game_manager: Node = %GameManager


func _on_body_entered(_body: Node2D) -> void:
    game_manager.keys += 1
    print("Keys: ", game_manager.keys)
    queue_free()
