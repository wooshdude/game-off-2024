extends Component
class_name GridPuppet

@export var master: GridComponent

func _ready() -> void:
	super()
	master.position_updated.connect(_on_position_updated)

func _on_position_updated():
	var tween_position: Tween = entity.create_tween()
	tween_position.tween_property(entity, "position", Vector3(master.Position.x, 0, master.Position.y), 0.2).set_ease(Tween.EASE_IN_OUT)

	var tween_rotation: Tween = entity.create_tween()
	tween_rotation.tween_property(entity, "rotation", Vector3(0, -master.entity.rotation, 0), 0.2).set_ease(Tween.EASE_IN_OUT)
