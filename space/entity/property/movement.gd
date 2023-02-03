class_name Movement extends Node3D

@export var max_speed := 100.0

func _physics_process(_delta):
	var entity := OwnerEntity.from(self)
	var velocity = entity \
			.get_children() \
			.map(_to_movement) \
			.reduce(func (acc, move): return acc + move, Vector3.ZERO) \
			.limit_length(max_speed)
	entity.velocity = entity.transform.basis * velocity
	entity.move_and_slide()

func _to_movement(property: Node) -> Vector3:
	if property.has_method('_move'):
		return property._move()
	else:
		return Vector3.ZERO
