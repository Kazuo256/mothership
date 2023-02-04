class_name PlayerInput extends Node3D

var shooting_dir := Vector2.ZERO

func _physics_process(_delta):
	shooting_dir = Input.get_vector(
			"player_shoot_left",
			"player_shoot_right",
			"player_shoot_up",
			"player_shoot_down"
	).normalized()
