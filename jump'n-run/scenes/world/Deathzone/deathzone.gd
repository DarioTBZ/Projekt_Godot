extends Area2D

var player: Node = null
signal player_fell_in_killzone

func _ready() -> void:
	player = get_node("/root/Level1/Player")
	if player and player.is_in_group("player"):
		connect("player_fell_in_killzone", Callable(player, "fell_into_killzone"))

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		emit_signal("player_fell_in_killzone")
		body.queue_free()
	elif body.is_in_group("enemy"):
		body.queue_free()
