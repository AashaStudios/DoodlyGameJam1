extends Control


@onready var key_counter_label: Label = $KeyCounter/KeyCounterLabel
@onready var game_manager: Node = %GameManager


func _process(_delta: float) -> void:
    key_counter_label.text = "Keys: " + str(game_manager.keys)
