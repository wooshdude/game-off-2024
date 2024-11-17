extends Component
class_name CameraComponent

@export var center_radius: float = 100

var canvas_layer: CanvasLayer
var cursor: Sprite2D
var center: Vector2
@onready var cursor_sprite = preload("res://icon.svg")
var camera: Camera3D
var left_edge: Sprite2D
var right_edge: Sprite2D
var camera_sensitivity: float = 0.005
var cursor_sensitivity: float = 0.5

enum Direction {
	RIGHT,
	LEFT
}

signal do_rotation(direction)

func _ready() -> void:
	super()

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	camera = get_viewport().get_camera_3d()

	canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)

	center = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width") / 2, ProjectSettings.get_setting("display/window/size/viewport_height") / 2)

	cursor_setup()
	add_child(cursor)

	edge_setup()
	add_child(left_edge)
	add_child(right_edge)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		cursor.global_position += Vector2(event.relative.x, event.relative.y * 0.5) * cursor_sensitivity
		camera.rotation -= Vector3(event.relative.y, event.relative.x, 0) * camera_sensitivity * cursor_sensitivity

func _process(_delta: float) -> void:
	var alpha_to_distance = Color(1,1,1,cursor.global_position.distance_to(center) / center_radius)
	cursor.modulate = alpha_to_distance
	right_edge.modulate = alpha_to_distance
	left_edge.modulate = alpha_to_distance
	cursor_sensitivity = (center_radius / clamp(cursor.global_position.distance_to(center),center_radius/2,center_radius) * 0.3)

	

	if cursor.global_position.distance_to(center) > center_radius:
		if cursor.global_position.x < center.x:
			do_rotation.emit(Direction.LEFT)

		elif cursor.global_position.x > center.x:
			do_rotation.emit(Direction.RIGHT)
		cursor.global_position = center
		camera.rotation.y = 0

	if Input.is_action_just_pressed("ui_accept"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func cursor_setup():
	cursor = Sprite2D.new()
	cursor.texture = cursor_sprite
	cursor.scale *= 0.1
	cursor.global_position = center

func edge_setup():
	right_edge = Sprite2D.new()
	right_edge.texture = cursor_sprite
	right_edge.scale *= 0.05
	right_edge.global_position = Vector2(center.x + center_radius, center.y)

	left_edge= Sprite2D.new()
	left_edge.texture = cursor_sprite
	left_edge.scale *= 0.05
	left_edge.global_position = Vector2(center.x - center_radius, center.y)
