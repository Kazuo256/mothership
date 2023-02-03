class_name Steering extends Node3D

@export var controller_path: NodePath
@export var steer_max := 1.0
@export var steer_delay := 1.0

@onready var controller := get_node_or_null(controller_path) as ShipController
@onready var steer := 0.0

func _physics_process(delta: float):
	var target := controller.steer_control * steer_max
	var step := absf(target) * delta / steer_delay
	if target == 0.0:
		step = steer_max * delta / steer_delay
	steer = move_toward(steer, target, step)

func _rotate() -> float:
	return steer
