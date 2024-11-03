extends Component
class_name PlayerMovement

@export var grid_component: GridComponent

func _ready() -> void:
	super()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
<<<<<<< Updated upstream
		var direction: Vector3 = Vector3.ZERO
		direction.z = event.get_action_strength("back") - event.get_action_strength("forward")
		var move_dir := direction * Basis(-entity.transform.basis.x, entity.transform.basis.y, entity.transform.basis.z)
		grid_component.Position += move_dir

		if event.is_action_pressed("left"):
			entity.rotation_degrees += Vector3(0,90,0)
			grid_component.position_updated.emit()
		elif event.is_action_pressed("right"):
			entity.rotation_degrees += Vector3(0,-90,0)
			grid_component.position_updated.emit()
=======
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
>>>>>>> Stashed changes
