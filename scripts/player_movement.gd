extends Component
class_name PlayerMovement

@export var grid_component: GridComponent
@export var camera_component: CameraComponent

func _ready() -> void:
	super()

	camera_component.do_rotation.connect(_on_do_rotation)

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var direction: Vector2
		direction = Input.get_vector("left", "right", "forward", "back")

		grid_component.Position += Vector2i(direction.rotated(entity.rotation))
		
		if event.is_action_pressed("q"):
			_on_do_rotation(CameraComponent.Direction.LEFT)
		elif event.is_action_pressed("e"):
			_on_do_rotation(CameraComponent.Direction.RIGHT)

func _on_do_rotation(direction: CameraComponent.Direction):
	print(direction)
	match direction:
		CameraComponent.Direction.LEFT:
			entity.rotation_degrees -= 90
		CameraComponent.Direction.RIGHT:
			entity.rotation_degrees += 90
	camera_component.camera.rotation = Vector3.ZERO
	camera_component.cursor.global_position = camera_component.center
