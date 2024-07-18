extends Area2D

@export var hp: float = 30

var item = self

func _on_body_entered(body):
	if body.has_method("heal"):
		body.heal(hp, item)
		
