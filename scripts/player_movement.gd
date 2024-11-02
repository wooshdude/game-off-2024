extends Component
class_name PlayerMovement

@export var grid_component: GridComponent

func _ready() -> void:
	super()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var direction: Vector3
		direction.z = event.get_action_strength("forward") - event.get_action_strength("back")
		print(direction)
		grid_component.Position += direction
