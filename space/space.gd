extends Node3D

func _ready():
	connect_spawn_signals(self)

func _spawn(node: Node3D):
	add_child(node)
	connect_spawn_signals(node)

func connect_spawn_signals(node: Node):
	if node.has_signal('spawn_requested'):
		node.connect('spawn_requested', self._spawn)
	node.get_children().map(connect_spawn_signals)
