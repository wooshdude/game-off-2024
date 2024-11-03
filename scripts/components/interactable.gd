extends Node
class_name Interactable

func _ready() -> void:
	InteractionHandler.interactables.append(self)
