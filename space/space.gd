class_name Space extends Node3D

var camera: Node3D
var player: PlayerShip
var mothership: Mothership

func _ready():
	connect_spawn_signals(self)
	_find_player()
	_find_mothership()
	assert(player != null)
	assert(mothership != null)
	_attach_camera_to_player()

func _physics_process(_delta):
	_find_player()
	_find_mothership()

func _spawn(node: Node3D):
	add_child(node)
	connect_spawn_signals(node)

func connect_spawn_signals(node: Node):
	if node.has_signal('spawn_requested'):
		node.connect('spawn_requested', self._spawn)
	node.get_children().map(connect_spawn_signals)

func _find_player():
	for node in get_tree().get_nodes_in_group('player'):
		if node is PlayerShip:
			player = node
			return
	player = null

func _find_mothership():
	for node in get_tree().get_nodes_in_group('mothership'):
		if node is Mothership:
			mothership = node
			return
	mothership = null

func _attach_camera_to_player():
	var remote_xform = RemoteTransform3D.new()
	remote_xform.remote_path = camera.get_path()
	remote_xform.update_rotation = false
	remote_xform.update_scale = false
	player.add_child(remote_xform)
