class_name FrontalThruster extends Node3D

@export var controller: Node3D
@export var ship_spec: ShipSpec

@onready var thrust := 0.0

func _move(delta: float) -> Vector3:
	var entity := OwnerEntity.from(self)
	thrust += controller.frontal_control * ship_spec.frontal_acceleration * delta
	return Vector3.FORWARD * thrust
