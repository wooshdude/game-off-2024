extends Component
class_name HandComponent

@export var item: Item
var grid_component: GridComponent

func _ready() -> void:
	super()
	if not grid_component:
		grid_component = find_sibling("GridComponent")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		match item.type:
			item.Type.MELEE_WEAPON:
				use_melee_weapon()
			item.Type.RANGED_WEAPON:
				use_ranged_weapon()
			item.Type.CONSUMABLE:
				use_consumable()

func use_melee_weapon():
	var facing_object: GridComponent = GridManager.get_object_at_position(grid_component.get_in_front())
	if facing_object:
		print(facing_object)

func use_ranged_weapon():
	pass

func use_consumable():
	pass
