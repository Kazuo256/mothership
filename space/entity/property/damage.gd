class_name Damage extends Node3D

@export var power := 1

func apply(target: Node3D):
	target.propagate_call('_take_hit', [power])
