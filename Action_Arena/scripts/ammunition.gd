extends Area2D

@export var ammo_amount: float = 12

var item = self

func _on_area_entered(area):
	if area.has_method("refill_ammo"):
		area.refill_ammo(ammo_amount, item)
