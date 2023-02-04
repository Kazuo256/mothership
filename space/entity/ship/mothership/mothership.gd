class_name Mothership extends CharacterBody3D

@export var fighter_max := 20

@onready var ship_controller = $ShipController as ShipController

func _physics_process(_delta):
	var figther_count = \
			get_tree().get_nodes_in_group('fighter').size()
	ship_controller.shooting[ShipController.Gun.PRIMARY] = \
			figther_count < fighter_max
