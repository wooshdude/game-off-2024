extends Node
class_name WorldRoot

@export var world2d: Node2D
@export var world3d: Node3D

func _ready() -> void:
	for child in self.get_children(false):
		if child is Node2D:
			world2d = child
		elif child is Node3D:
			world3d = child

	GridManager.world_root = self
