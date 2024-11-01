extends Node
class_name Component

var entity:Node3D

# Searches tree for nearest Node2D parent node.
func _ready() -> void:
	var last_node = self
	while entity == null:
		last_node = last_node.get_parent()
		if last_node is Node3D:
			entity = last_node

	#print(entity)
