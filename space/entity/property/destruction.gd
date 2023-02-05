class_name Destruction extends Node3D

signal destroyed

@export var hit_points := 1

@onready var is_destroyed := false

func _take_hit(damage: int):
	if hit_points > 0:
		hit_points = max(hit_points - damage, 0)

func _physics_process(_delta):
	if hit_points == 0 and not is_destroyed:
		is_destroyed = true
		destroyed.emit()
