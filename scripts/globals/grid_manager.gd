extends Node

var objects:Dictionary = {}
var world:GridMap = GridMap.new()

func _ready() -> void:
	self.add_child(world)

func check_valid_position(position: Vector3):
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


func world_to_cell(position: Vector3):
	return world.local_to_map(position)

func cell_to_world(position: Vector3):
	return world.map_to_local(position)
