extends Node

var level = preload("res://scenes/grid_example.tscn")

func _ready() -> void:
	var new_level = level.instantiate()
	self.add_child(new_level)
