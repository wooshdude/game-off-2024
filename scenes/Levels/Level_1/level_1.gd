extends Node3D

const walls_floors = preload("res://scenes/Levels/Level_1/Walls_Floors.tscn")
var mapClass = preload("res://scripts/components/map_level_1.gd")
var Map = mapClass.new()
var cells = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_map()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generate_map():
	var tileMap = Map.get_tileMap()
	print("the tilemap ; ", Map.get_tileMap())
	#var used_tiles = tileMap.get_used_cells()
	#for tile in used_tiles:
	#	var cell = walls_floors.instance()
	#	add_child(cell)
	#	cell.translation = Vector3(tile.x*2, 0, tile.y*2)
	#	cells.append(cell)
	#for cell in cells:
	#	cell.update_faces(used_tiles)
