extends Node3D

@export var Player: PackedScene
@export var Floor: PackedScene
@onready var new_player
@onready var this_floor
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_player = Player.instantiate()
	self.add_child(new_player)
	this_floor = Floor.instantiate()
	self.add_child(this_floor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
