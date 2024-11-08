extends Component
class_name InteractionComponent

@export var area3d: Area3D
var mouse_inside: bool

signal interacted

func _ready() -> void:
	super()

	area3d.mouse_entered.connect(_on_mouse_entered)
	area3d.mouse_exited.connect(_on_mouse_exited)

func _input(event: InputEvent) -> void:
	if not mouse_inside: return
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			interacted.emit()

func _process(_delta: float) -> void:
	if area3d.global_position.distance_to(get_viewport().get_camera_3d().global_position) > 2: mouse_inside = false

func _on_mouse_entered():
	if area3d.global_position.distance_to(get_viewport().get_camera_3d().global_position) > 2: return
	mouse_inside = true

func _on_mouse_exited():
	if area3d.global_position.distance_to(get_viewport().get_camera_3d().global_position) > 2: return
	mouse_inside = false


