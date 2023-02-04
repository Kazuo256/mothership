class_name ShipController extends Node3D

enum Gun {
	PRIMARY,
}

var frontal_control := 0.0
var steer_control := 0.0
var shooting_dir := Vector2.ZERO
var shooting := {
	Gun.PRIMARY: false,
}
