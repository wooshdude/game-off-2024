extends	Component 
class_name Interactable

var enabled: bool = false
@export var grid_component: GridComponent

func _ready() -> void:
	super()

	if grid_component == null:
		grid_component = find_sibling("GridComponent")

	InteractionHandler.register_interactable(self)