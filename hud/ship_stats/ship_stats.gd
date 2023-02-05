extends VBoxContainer

@export var ship_type: Script
@export var smooth := 5.0

var ship: Node3D
var destruction: Destruction
var hull_max := 1
var hull_current := 1

func _game_start(ships: Array):
	ship = ships \
			.filter(func(node): return node.get_script() == ship_type) \
			.front()
	$ShipName.text = ship.name
	destruction = OwnerEntity.find_property(ship, Destruction)
	hull_max = destruction.hit_points
	hull_current = hull_max

func _process(delta):
	if is_instance_valid(ship):
		hull_current = destruction.hit_points
	else:
		hull_current = 0
	var target_value := 100.0 * hull_current / hull_max
	var current_value := $HullBar.value as float
	current_value += (target_value - current_value) * smooth * delta
	$HullBar.value = current_value
