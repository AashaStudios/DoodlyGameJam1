extends Node2D


@onready var game_manager: Node = %GameManager
@onready var interaction_area: InteractionArea = $InteractionArea


func _ready() -> void:
    interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
    game_manager.keys += 1
    queue_free()
