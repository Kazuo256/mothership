class_name PlayerInput extends Node3D

@export var ship_controller: ShipController

func _physics_process(_delta):
	if Input.get_joy_name(0).is_empty():
		var mouse_pos := get_viewport().get_mouse_position()
		var center_pos := get_viewport().get_visible_rect().get_center()
		ship_controller.shooting_dir = (mouse_pos - center_pos).normalized()
	else:
		ship_controller.shooting_dir = Input.get_vector(
				"player_shoot_left",
				"player_shoot_right",
				"player_shoot_up",
				"player_shoot_down"
		).normalized()
	ship_controller.frontal_control = \
			Input.get_axis("player_backward", "player_forward")
	ship_controller.steer_control = \
			Input.get_axis("player_steer_right", "player_steer_left")
	ship_controller.shooting[ShipController.Gun.PRIMARY] = \
			Input.is_action_pressed("player_shoot_1")
