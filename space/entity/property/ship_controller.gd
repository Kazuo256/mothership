class_name ShipController extends Node3D

enum Gun {
	PRIMARY,
}

@export var frontal_control := 0.0
@export var steer_control := 0.0
var shooting_dir := Vector2.ZERO
var shooting := {
	Gun.PRIMARY: false,
}

func move_towards(dir: Vector3, speed: float):
	var entity := OwnerEntity.from(self)
	var xform_basis := entity.transform.basis
	var angle := (-xform_basis.z).angle_to(dir)
	var side := sign(xform_basis.x.dot(dir))
	frontal_control = clamp(speed, 0.0, 1.0)
	steer_control = -side * clamp(angle, -1, 1)
