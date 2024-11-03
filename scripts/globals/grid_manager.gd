extends Node

var objects:Dictionary = {}
var world:TileMapLayer = TileMapLayer.new()

func _ready() -> void:
	world.tile_set = load("res://tile_set.tres")
	self.add_child(world)

func check_valid_position(position: Vector2):
	# Check if another object is in the way
	if position in objects.keys():
		return false
	return true

func register_object(obj: GridComponent):
	if not obj in objects.values():
		objects[obj.Position] = obj

func remove_object(obj: GridComponent):
	if obj in objects.values():
		objects.erase(obj.Position)

func world_to_cell(world_position: Vector2) -> Vector2i:
	return world.local_to_map(world_position)

func cell_to_world(cell_position: Vector2i) -> Vector2:
	return world.map_to_local(cell_position)
