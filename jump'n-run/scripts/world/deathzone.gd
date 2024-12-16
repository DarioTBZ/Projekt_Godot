extends Area2D



func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		body.queue_free()
		print("Player died")
	elif body.is_in_group("enemy"):
		body.queue_free()
