extends Component
class_name GridComponent

var Position:Vector3 :
	set(value):
		if GridManager.check_valid_position(value):
			Position = value
			entity.position = Position * 10
	get:
		return Position

func _ready() -> void:
	super()
	GridManager.register_object(self)
