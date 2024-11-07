extends Node3D
class_name WallsFloors

@onready var floorTile = $FloorGrassWithRock
@onready var northWall = $NorthWall
@onready var eastWall = $EastWall
@onready var westWall = $WestWall
@onready var southWall = $SouthWall
@onready var grid_size = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update_faces(cell_list) -> void:
	var my_grid_position = Vector2(position.x/grid_size, position.z/2)
	if cell_list.has(my_grid_position + Vector2.RIGHT):
		eastWall.queue_free()
	if cell_list.has(my_grid_position + Vector2.LEFT):
		westWall.queue_free()
	if cell_list.has(my_grid_position + Vector2.DOWN):
		southWall.queue_free()
	if cell_list.has(my_grid_position + Vector2.UP):
		northWall.queue_free()
