extends Component
class_name GridComponent

var Position:Vector3 :
	set(value):
		if GridManager.check_valid_position(value):
			GridManager.remove_object(self)
			Position = value
			# grid components live exclusivley using grid coordinates
			# make sure to use proper conversions when setting grid positions
			entity.position = GridManager.cell_to_world(Position)
			GridManager.register_object(self)
	get:
		return Position

func _ready() -> void:
	super()
	Position = GridManager.world_to_cell(entity.position)
	GridManager.register_object(self)
