extends Component
class_name GridPuppet

@export var master: GridComponent
@export var grid_size: int = 2

func _ready() -> void:
	super()
	master.position_updated.connect(_on_position_updated)

func _on_position_updated():
	var tween_position: Tween = entity.create_tween()
	tween_position.tween_property(entity, "position", Vector3(master.Position.x, 0, master.Position.y) * grid_size, 0.2).set_ease(Tween.EASE_IN_OUT)

func _process(delta: float) -> void:
	entity.rotation.y = move_toward(entity.rotation.y, -master.entity.rotation, 10*delta)
