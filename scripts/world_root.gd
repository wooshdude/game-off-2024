@tool
extends Node
class_name WorldRoot

@export var world2d: Node2D
@export var world3d: Node3D

func _ready() -> void:
	if Engine.is_editor_hint():
		if self.get_child_count() == 0:
			add_child(world2d)
			add_child(world3d)

	for child in self.get_children(false):
		if child is Node2D:
			world2d = child
		elif child is Node3D:
			world3d = child

	GridManager.world_root = self
