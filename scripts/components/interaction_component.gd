extends Component
class_name InteractionComponent

@export var grid_component: GridComponent

var looking_at: Interactable

func _ready() -> void:
	super()
	if grid_component == null:
		grid_component = find_sibling("GridComponent")
	grid_component.position_updated.connect(_on_position_updated)

func _on_position_updated() -> void: 
	var front_position:Vector2i = grid_component.get_in_front() 
	var facing_object: GridComponent = GridManager.get_object_at_position(front_position)
	looking_at = facing_object.find_sibling("Interactable") if looking_at == null and facing_object != null and facing_object.find_sibling("Interactable") else null

	if Input.is_action_just_pressed("ui_accept") and looking_at != null:
		print('interacted')
	if Input.is_action_just_pressed("ui_accept"):
		print('fuck')
