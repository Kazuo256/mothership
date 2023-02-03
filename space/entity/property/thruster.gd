class_name Thruster extends Node3D

@export var controller: ShipController
@export var thrust_max := 1.0
@export var thrust_delay := 1.0

@onready var thrust := 0.0

func _physics_process(delta: float):
	var target := controller.frontal_control * thrust_max
	var step := absf(target) * delta / thrust_delay
	thrust = move_toward(thrust, target, step)

func _move() -> Vector3:
	return -transform.basis.z * thrust
