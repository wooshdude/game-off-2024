extends Node

var interactables: Array[Interactable]
var interactors: Array[InteractionComponent]

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	for i in interactables:
		for a in interactors:
			pass

func register_interactable(interactable: Interactable):
	if interactable not in interactables:
		interactables.append(interactable)

func register_actor(actor: InteractionComponent):
	if actor not in interactors:
		interactors.append(actor)