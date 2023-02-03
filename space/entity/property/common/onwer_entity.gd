class_name OwnerEntity extends Object

func _init():
	@warning_ignore("assert_always_false")
	assert(false)

static func from(node: Node) -> CharacterBody3D:
	var entity := node.owner as CharacterBody3D
	assert(entity != null)
	return entity
