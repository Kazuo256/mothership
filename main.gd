extends Node3D

@export var space_scn: PackedScene

@onready var camera_focus = $CameraFocus
@onready var space: Space = null

func _ready():
	_reload_space()
	pass

func _reload_space():
	if space != null:
		space.tree_exited.connect(func():
			space = null
			_reload_space()
		)
		space.queue_free()
	else:
		space = space_scn.instantiate()
		space.camera = camera_focus
		add_child(space)
