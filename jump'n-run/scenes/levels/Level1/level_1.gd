extends Area2D

var level2_path = "res://scenes/levels/Level2/level_2.tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Gamemanager.current_level.queue_free()
		Gamemanager.load_level(level2_path)
