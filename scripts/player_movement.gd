extends Component
class_name PlayerMovement

@export var grid_component: GridComponent

func _ready() -> void:
	super()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var direction: Vector2
		direction.y = event.get_action_strength("back") - event.get_action_strength("forward")
		print(direction)
		grid_component.Position += Vector2i(direction.rotated(entity.rotation))

		if event.is_action_pressed("left"):
			entity.rotation_degrees -= 90
			grid_component.position_updated.emit()
		if event.is_action_pressed("right"):
			grid_component.position_updated.emit()
			entity.rotation_degrees += 90
