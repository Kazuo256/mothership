class_name Hitbox extends Area3D

@export var power := 1

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Node3D):
	if area is Hurtbox:
		area.owner.propagate_call('_take_hit', [power])
