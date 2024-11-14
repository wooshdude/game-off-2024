extends Component
class_name FreeMoveComponent

var velocity: Vector2
@export var speed: float
@export var sensitivity: float = 0.3

func _ready() -> void:
	super()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		entity.rotate(deg_to_rad(event.relative.x * sensitivity))

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "forward", "back")
	velocity = direction.rotated(entity.rotation) * speed
	entity.global_position += velocity
