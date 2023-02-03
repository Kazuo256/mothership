class_name Rotation extends Node3D

@export var max_speed := 1.0

func _physics_process(delta):
	var entity := OwnerEntity.from(self)
	var rotation_speed := entity \
			.get_children() \
			.map(_to_rotation) \
			.reduce(func (acc, move): return acc + move)
	rotation_speed = clampf(rotation_speed, -max_speed, max_speed)
	entity.rotation.y += rotation_speed * delta

func _to_rotation(property: Node) -> float:
	if property.has_method('_rotate'):
		return property._rotate()
	else:
		return 0.0
