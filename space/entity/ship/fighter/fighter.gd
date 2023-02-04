extends CharacterBody3D

@export var turn_away_duration := 1.0

var player_ship: PlayerShip
var retry_timer: SceneTreeTimer

@onready var ship_controller = $ShipController as ShipController

func _physics_process(_delta):
	if _find_player():
		if _is_player_far() and retry_timer == null:
			_follow_player()
		else:
			_turn_away()
		if _is_aim_locked():
			_shoot()
		else:
			_stop_shooting()
	else:
		_patrol()

func _find_player() -> bool:
	player_ship = null
	for body in $PlayerDetection.get_overlapping_bodies():
		if body is PlayerShip:
			player_ship = body
			return true
	return false

func _is_player_far() -> bool:
	return not player_ship in $ProximityDetection.get_overlapping_bodies()

func _follow_player():
	var diff := player_ship.position - position
	ship_controller.move_towards(diff, 1.0)

func _turn_away():
	var diff := position - player_ship.position
	ship_controller.move_towards(diff, 1.0)
	retry_timer = get_tree().create_timer(turn_away_duration)
	retry_timer.timeout.connect(func(): retry_timer = null)

func _is_aim_locked() -> bool:
	return player_ship in $AimDetection.get_overlapping_bodies()

func _shoot():
	ship_controller.shooting[ShipController.Gun.PRIMARY] = true

func _stop_shooting():
	ship_controller.shooting[ShipController.Gun.PRIMARY] = false

func _patrol():
	ship_controller.frontal_control = 0.2
	ship_controller.steer_control = 0.5
	ship_controller.shooting[ShipController.Gun.PRIMARY] = false
