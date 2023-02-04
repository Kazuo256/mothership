extends CharacterBody3D

func debug() -> Debug:
	return $Debug

func _physics_process(_delta):
	if Input.is_action_pressed("ui_accept"):
		$GunLeft.shoot()
		$GunRight.shoot()
	pass
