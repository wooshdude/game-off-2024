extends Area3D
class_name WallsFloors

@onready var floorTile = $FloorGrassWithRock
@onready var northWall = $NORTHWall
@onready var eastWall = $EASTWall
@onready var westWall = $WESTWall
@onready var southWall = $SOUTHWall
@onready var grid_size = 2
@onready var new_wall 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#new_wall = floorTile.instantiate()
	#self.add_child(new_wall)
	#new_wall = northWall.instantiate()
	#self.add_child(new_wall)
	#new_wall = eastWall.instantiate()
	#self.add_child(new_wall)
	#new_wall = westWall.instantiate()
	#self.add_child(new_wall)
	#new_wall = southWall.instantiate()
	#self.add_child(southWall)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update_faces(cell_list) -> void:
	var grid_position =Vector2(position.x/2,position.z/2) # Test local again
	print("cell_list : ", cell_list)

	for i in cell_list.size():
		if cell_list[i] == Vector2i(grid_position -  Vector2.RIGHT):
			print("Vector2.RIGHT : ")
			southWall.queue_free()
		if cell_list[i] == Vector2i(grid_position -  Vector2.LEFT):
			print("Vector2.LEFT : ")
			northWall.queue_free()
		if cell_list[i] == Vector2i(grid_position + Vector2.DOWN):
			print("Vector2.DOWN : ")
			eastWall.queue_free()
		if cell_list[i] == Vector2i(grid_position + Vector2.UP):
			print("Vector2.UP : ")
			westWall.queue_free()
