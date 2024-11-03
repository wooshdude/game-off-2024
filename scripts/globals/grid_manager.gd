extends Node

var objects:Dictionary = {}
var world:TileMapLayer = TileMapLayer.new()

var tile_set = preload("res://resources/tile_set_default.tres")

func _ready() -> void:
	world.tile_set = tile_set
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

func world_to_cell(position: Vector2):
	return world.local_to_map(position)

func cell_to_world(position: Vector2i):
	return world.map_to_local(position)
