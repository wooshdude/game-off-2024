extends Component
class_name PlayerMovement

@export var grid_component: GridComponent

func _ready() -> void:
	super()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		grid_component.Position += Vector3(0,0,-1)
