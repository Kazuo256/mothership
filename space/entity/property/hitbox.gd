class_name Hitbox extends Area3D

signal hit(target: Node3D)

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Node3D):
	if area is Hurtbox:
		hit.emit(area.owner)
		owner.queue_free()
