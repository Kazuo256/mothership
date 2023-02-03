class_name FixedVelocity extends Node3D

@export var speed := 1.0

func _move() -> Vector3:
	return OwnerEntity.from(self).transform.basis * Vector3.FORWARD * speed
