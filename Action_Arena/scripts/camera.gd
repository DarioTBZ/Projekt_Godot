extends Camera2D

@export var shake_decay = 0.8
@export var shake_max_offset = Vector2(10, 5)

var shake_strength = 0.0

func _process(delta):
	if shake_strength > 0:
		shake_strength = max(shake_strength - shake_decay * delta, 0)
		offset = Vector2(
			randf_range(-1, 1) * shake_max_offset.x,
			randf_range(-1, 1) * shake_max_offset.y
		) * shake_strength

func shake(strength):
	shake_strength = min(shake_strength + strength, 1.0)

func _on_gun_shot():
	shake(0.2)
