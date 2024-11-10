extends Resource
class_name Item

enum Type {
	MELEE_WEAPON,
	RANGED_WEAPON,
	CONSUMABLE
}

@export var item: String
@export_multiline var description: String
@export var sprite: Texture
@export var type: Type

