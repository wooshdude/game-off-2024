extends Sprite2D

@export var grid_component: GridComponent

func _ready() -> void:
	top_level = true

func _physics_process(delta: float) -> void:
	position = GridManager.cell_to_world(grid_component.rotated(grid_component.entity.rotation))