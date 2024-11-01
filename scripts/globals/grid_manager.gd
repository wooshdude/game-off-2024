extends Node

var objects:Dictionary = {}
var world:GridMap

func check_valid_position(position: Vector3):
	# Check if another object is in the way
	if position in objects.keys():
		return false
	return true

func register_object(obj: GridComponent):
	if not obj in objects.values():
		objects[obj.Position] = obj
