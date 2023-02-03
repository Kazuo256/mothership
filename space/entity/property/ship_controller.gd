class_name ShipController extends Node3D

var frontal_control := 0.0
var steer_control := 0.0

func _physics_process(_delta):
	frontal_control = \
			Input.get_action_strength("player_forward") - \
			Input.get_action_strength("player_backward")
	steer_control = \
			Input.get_action_strength("player_steer_left") - \
			Input.get_action_strength("player_steer_right")
