class_name Destruction extends Node3D

signal destroyed

@export var hit_points := 1

func _take_hit(damage: int):
	if hit_points > 0:
		hit_points = max(hit_points - damage, 0)
		if hit_points == 0:
			destroyed.emit()
