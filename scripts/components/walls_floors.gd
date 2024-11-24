extends Area3D
class_name WallsFloors

@onready var floorTile = $FloorGrassWithRock
@onready var northWall = $NORTHWall/Cube
@onready var eastWall = $EASTWall/Cube
@onready var westWall = $WESTWall/Cube
@onready var southWall = $SOUTHWall/Cube
@onready var grid_size = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update_faces(cell_list) -> void:
	
	var grid_position =Vector2(2,1) # Test local
	#var grid_pos = Vector2(cell_list.position.x*2,cell_list.position.z*2)
	print("We are here now! : ", cell_list)
	print("We are here Vector2.RIGHT! : ", Vector2.RIGHT)
	#print("We are here  cell_list+ Vector2.RIGHT! : ", cell_list+ Vector2.RIGHT)
	
	if cell_list.has(grid_position + Vector2.RIGHT):
		eastWall.queue_free()
	if cell_list.has(grid_position + Vector2.LEFT):
		westWall.queue_free()
	if cell_list.has(grid_position + Vector2.DOWN):
		southWall.queue_free()
	if cell_list.has(grid_position + Vector2.UP):
		northWall.queue_free()
