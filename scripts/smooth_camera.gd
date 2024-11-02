extends Camera3D
class_name SmoothCamera

@export var grid_component: GridComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    top_level = true
    position = grid_component.entity.position
    rotation_degrees = grid_component.entity.rotation_degrees
    grid_component.position_updated.connect(_on_position_updated)


func _on_position_updated():
    var tween_position: Tween = self.create_tween()
    tween_position.tween_property(self, "position", grid_component.entity.position, 0.2)

    var tween_rotation: Tween = self.create_tween()
    tween_rotation.tween_property(self, "rotation_degrees", grid_component.entity.rotation_degrees, 0.2)
