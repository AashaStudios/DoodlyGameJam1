extends Node2D


@onready var game_manager: Node = %GameManager
@onready var interaction_area: InteractionArea = $InteractionArea


func _ready() -> void:
    interaction_area.interact = Callable(self, "_on_interact")
    var tween: Tween = create_tween()
    tween.set_loops()
    tween.tween_property($"Sprite2D", "position", Vector2(0, -4), 0.75).set_trans(Tween.TRANS_CUBIC)
    tween.tween_property($"Sprite2D", "position", Vector2(0, 0), 0.75).set_trans(Tween.TRANS_CUBIC)


func _on_interact():
    game_manager.keys += 1
    queue_free()
