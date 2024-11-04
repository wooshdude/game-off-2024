extends Node

var interactables: Array[Interactable]
var interactors: Array[InteractionComponent]

func _ready() -> void:
    pass

func _physics_process(_delta: float) -> void:
    for i: Interactable in interactables:
        for a: InteractionComponent in interactors:
            if a.grid_component.Position + Direction.rotate(Direction.FRONT, a.entity.rotation) == i.grid_component.Position:
                i.enabled = true
            else:
                i.enabled = false

func register_interactable(interactable: Interactable):
    if interactable not in interactables:
        interactables.append(interactable)

func register_actor(actor: InteractionComponent):
    if actor not in interactors:
        interactors.append(actor)