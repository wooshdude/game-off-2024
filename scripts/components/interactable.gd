extends Node
class_name Interactable

var enabled: bool = false

func _ready() -> void:
	InteractionHandler.register_interactable(self)
