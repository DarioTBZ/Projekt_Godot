extends Area2D

@onready var radius = $BlastRadius

func explode():
	for body in radius.get_overlapping_bodies():
		if body.has_method("die"):
			body.die()
			queue_free()

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		explode()
