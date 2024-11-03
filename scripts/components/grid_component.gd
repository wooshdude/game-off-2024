extends Component
class_name GridComponent

signal position_updated

<<<<<<< Updated upstream
var Position:Vector3 :
=======
enum Direction {
	NORTH = 0,
	SOUTH = 180,
	EAST = 90,
	WEST = -90
}

var Position:Vector2i :
>>>>>>> Stashed changes
	set(value):
		if GridManager.check_valid_position(value):
			GridManager.remove_object(self)
			Position = value
			# grid components live exclusivley using grid coordinates
			# make sure to use proper conversions when setting grid positions
			entity.position = GridManager.cell_to_world(Position)
			#entity.global_position = value * 16
			GridManager.register_object(self)
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
			position_updated.emit()
	get:
		return Position

func _ready() -> void:
	super()
	Position = GridManager.world_to_cell(entity.position)
	print("position on ready ", GridManager.world_to_cell(entity.position))
	GridManager.register_object(self)
