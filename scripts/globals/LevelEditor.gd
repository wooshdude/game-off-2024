extends Node3D

@export var Map: PackedScene
@export var Walls_Floors: PackedScene
@onready var new_walls_floors
@onready var new_map
var cells = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Create a new Tile Map Scene
	new_map = Map.instantiate()
	self.add_child(new_map)

	generate_map()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generate_map():
	#grab the tile map 
	var tileMap = new_map.get_tileMap()
	#get the cells used in the tile map
	var used_tiles = tileMap.get_used_cells()
	
	new_map.free()
	#loop through the tile mapp
	for tile in used_tiles:
		#Create a new 3d cell
		var cell = Walls_Floors.instantiate()
		add_child(cell)
		
		var cellTranslation = Vector3(tile.x*2, 0, tile.y*2)
		cell.position = cellTranslation #Vector3(tile.x*2, 0, tile.y*2)
		cells.append(cell)
		
	for cell in cells:
		cell.update_faces(used_tiles)
