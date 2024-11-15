extends Component
class_name HealthComponent

signal destroyed

@export var health: float :
	set(value):
		if value <= 0:
			destroyed.emit()
		
		health = clamp(health + value, 0, max_health)
	get:
		return health

var max_health: float

func _ready() -> void:
	super()
	max_health = health

func heal(value: float):
	health += abs(value)

func harm(value: float):
	health -= abs(value)
