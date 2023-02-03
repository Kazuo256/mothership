class_name Movement extends Node3D

@export var max_speed := 1.0

func _physics_process(_delta):
	var entity := OwnerEntity.from(self)
	entity.velocity = entity \
			.get_children() \
			.map(_to_movement) \
			.reduce(func (acc, move): return acc + move) \
			.limit_length(max_speed)
	entity.move_and_slide()

func _to_movement(property: Node3D) -> Vector3:
	if property.has_method('_move'):
		return property._move()
	else:
		return Vector3.ZERO
