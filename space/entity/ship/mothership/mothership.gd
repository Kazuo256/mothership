class_name Mothership extends CharacterBody3D

@export var fighter_max := 30

@onready var ship_controller = $ShipController as ShipController

func _physics_process(_delta):
	position.y = 0
	var gun_count := get_children() \
			.reduce(func(acc, node): return acc + (1 if node is Gun else 0), 0)
	var figther_count = \
			get_tree().get_nodes_in_group('fighter').size()
	ship_controller.shooting[ShipController.Gun.PRIMARY] = \
			figther_count + gun_count < fighter_max
