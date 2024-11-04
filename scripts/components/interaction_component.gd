extends Component
class_name InteractionComponent

@export var grid_component: GridComponent

func _ready() -> void:
	super()
	if grid_component != null:
		grid_component = entity.find_sibling(GridComponent)
