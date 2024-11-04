extends Component
class_name InteractionComponent

@export var grid_component: GridComponent

func _ready() -> void:
	super()
	InteractionHandler.register_actor(self)
	if grid_component == null:
		grid_component = find_sibling("GridComponent")
