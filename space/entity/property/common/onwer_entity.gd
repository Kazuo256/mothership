class_name OwnerEntity extends Object

func _init():
	@warning_ignore("assert_always_false")
	assert(false)

static func from(node: Node) -> CharacterBody3D:
	var entity := node.owner as CharacterBody3D
	assert(entity != null)
	return entity

static func find_property(entity: Node, property_type: Script) -> Node:
	return entity.get_children().filter(func(node):
		return node.get_script() == property_type
	).front()
