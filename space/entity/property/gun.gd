class_name Gun extends Node3D

signal spawn_requested(node: Node3D)

@export var projectile_scn: PackedScene
@export var cooldown_duration := 1.0
@export var warmup_duration := 0.5

var cooldown_timer: SceneTreeTimer
var warmup_timer: SceneTreeTimer
var warmup_required := true
var shooting := false

func shoot():
	shooting = true

func _physics_process(_delta):
	if shooting:
		if cooldown_timer == null and not warmup_required:
			var projectile := projectile_scn.instantiate() as Node3D
			projectile.position = global_position
			projectile.rotation = global_rotation
			spawn_requested.emit(projectile)
			cooldown_timer = get_tree().create_timer(cooldown_duration)
			cooldown_timer.timeout.connect(func(): cooldown_timer = null)
		elif warmup_required and warmup_timer == null:
			warmup_timer = get_tree().create_timer(warmup_duration)
			warmup_timer.timeout.connect(func():
					warmup_timer = null
					warmup_required = false
			)
		shooting = false
	else:
		warmup_required = true
