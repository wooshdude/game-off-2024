extends Component
class_name FreeMovePuppet

@export var free_move_component: FreeMoveComponent

func _process(_delta: float) -> void:
	entity.global_position = Vector3(
		free_move_component.entity.global_position.x,
		0,
		free_move_component.entity.global_position.y
	)

	entity.rotation = Vector3(0,-free_move_component.entity.rotation,0)
