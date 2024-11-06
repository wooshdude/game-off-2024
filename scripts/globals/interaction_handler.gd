extends Node

var interactables: Dictionary = {}

func _ready() -> void:
	pass

func register_interactable(interactable: Interactable):
	if not interactables.has(interactable):
		interactables[interactable.grid_component.Position] = interactable

func get_object_at_position(position: Vector2i) -> Interactable:
	if interactables.has(position):
		print('getting interaction at position ', position)
		print(interactables[position])
		return interactables[position]
	return null 
