extends Node2D


@onready var game_manager: Node = %GameManager
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var collision_shape_2d: CollisionShape2D = $InteractionArea/CollisionShape2D


func _ready() -> void:
    interaction_area.interact = Callable(self, "_on_interact")
    var tween: Tween = create_tween()
    tween.set_loops()
    tween.tween_property($Sprite2D, "position", Vector2(0, -4), 0.75).set_trans(Tween.TRANS_CUBIC)
    tween.tween_property($Sprite2D, "position", Vector2(0, 0), 0.75).set_trans(Tween.TRANS_CUBIC)


func _on_interact():
    game_manager.keys += 1
    
    var pitch_value: float = randf_range(0.9, 1.1)
    
    var pickup_tween = create_tween()
    pickup_tween.tween_property($Sprite2D, "visible", false, 0)
    pickup_tween.tween_property(collision_shape_2d, "disabled", true, 0)
    pickup_tween.tween_property($PickupSound, "pitch_scale", pitch_value, 0)
    pickup_tween.tween_property($PickupSound, "playing", true, 0)
    pickup_tween.tween_interval(1)
    pickup_tween.tween_callback($".".queue_free)
