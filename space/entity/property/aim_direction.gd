extends Node3D

@export var ship_controller: ShipController

func _physics_process(_delta):
	if not ship_controller.shooting_dir.is_zero_approx():
		var dir2d := ship_controller.shooting_dir
		global_rotation.y = dir2d.angle_to(Vector2.UP)
