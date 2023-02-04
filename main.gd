extends Node3D

@export var space_scn: PackedScene
@export var retry_delay := 1.0

@onready var camera_focus = $CameraFocus
@onready var space: Space = null

func _ready():
	_load_space()

func _physics_process(_delta):
	if space != null and space.player == null and not %Gameover.visible:
		%Gameover.show()
		await get_tree().create_timer(retry_delay).timeout
		%Retry.show()

func _input(event):
	if %Retry.visible and event.is_action_pressed("player_shoot_1"):
		%Retry.hide()
		%Gameover.hide()
		space.tree_exited.connect(_load_space)
		space.queue_free()
		space = null

func _load_space():
	space = space_scn.instantiate()
	space.camera = camera_focus
	add_child(space)
