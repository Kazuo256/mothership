extends CharacterBody3D

@onready var player_input := $PlayerInput as PlayerInput

func debug() -> Debug:
	return $Debug

func _physics_process(_delta):
	if not player_input.shooting_dir.is_zero_approx():
		var dir2d := player_input.shooting_dir
		$GunAxis.global_rotation.y = dir2d.angle_to(Vector2.UP)
		$GunAxis/GunLeft.shoot()
		$GunAxis/GunRight.shoot()
