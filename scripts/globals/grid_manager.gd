extends Node

var objects:Dictionary = {}
var world_map:TileMapLayer = TileMapLayer.new()

var world_root: WorldRoot

var tile_set = preload("res://resources/tile_set_default.tres")

func _ready() -> void:
	world_map.tile_set = tile_set
	self.add_child(world_map)

func check_valid_position(position: Vector2):
	# Check if another object is in the way
	if position in objects.keys():
		return false
	return true

func get_object_at_position(position: Vector2i) -> GridComponent:
	if objects.has(position):
		return objects[position]
	return null

func get_neighbors(position: Vector2i) -> Array[GridComponent]:
	var neighbors: Array[GridComponent]
	var positions: Array[Vector2i] = [
		# up
		position + Vector2i(0,-1),
		# down
		position + Vector2i(0,1),
		# left
		position + Vector2i(-1,0),
		# right
		position + Vector2i(1,0)
	]

	for pos in positions:
		var n = get_object_at_position(pos)
		if n:
			neighbors.append(n)

	return neighbors

func register_object(obj: GridComponent):
	if not obj in objects.values():
		objects[obj.Position] = obj

func remove_object(obj: GridComponent):
	if obj in objects.values():
		objects.erase(obj.Position)

func world_to_cell(position: Vector2) -> Vector2i:
	return world_map.local_to_map(position)

func cell_to_world(position: Vector2i) -> Vector2:
	return world_map.map_to_local(position)
