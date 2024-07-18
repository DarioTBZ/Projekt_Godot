extends Area2D

var value: int = 1

func _on_body_entered(body):
	if body.has_method("collect_coin"):
		Global.coins += value
		body.collect_coin(value)
		self.queue_free()

