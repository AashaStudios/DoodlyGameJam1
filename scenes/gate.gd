extends StaticBody2D


@onready var game_manager: Node = %GameManager


func _process(_delta: float) -> void:
    if game_manager.keys == 3:
        var gate_open_tween := create_tween()
        gate_open_tween.tween_property($Sprite2D, "position", Vector2(0, -64), 1)
        gate_open_tween.tween_property($CollisionShape2D, "disabled", true, 0)
