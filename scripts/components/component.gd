extends Node
class_name Component

var entity: Node

# Searches tree for nearest Node2D parent node.
func _ready() -> void:
	var last_node = self
	while entity == null:
		last_node = last_node.get_parent()
		if last_node is Node3D or last_node is Node2D:
			entity = last_node

	print("Discovered parent ", entity.name)

func find_sibling(type: String) -> Component:
	for child in get_parent().get_children(true):
		if child.name == type:
			print("Found sibling %s" % child.name)
			return child
	print('Sibling of type %s not found' % type)
	return null
