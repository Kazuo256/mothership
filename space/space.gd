class_name Space extends Node3D

var camera: Node3D

func _ready():
	connect_spawn_signals(self)
	_attach_camera_to_player()

func _spawn(node: Node3D):
	add_child(node)
	connect_spawn_signals(node)

func connect_spawn_signals(node: Node):
	if node.has_signal('spawn_requested'):
		node.connect('spawn_requested', self._spawn)
	node.get_children().map(connect_spawn_signals)

func _attach_camera_to_player():
	var player: PlayerShip = null
	for node in get_tree().get_nodes_in_group('player'):
		if node is PlayerShip:
			player = node
			break
	assert(player != null)
	var remote_xform = RemoteTransform3D.new()
	remote_xform.remote_path = camera.get_path()
	player.add_child(remote_xform)
