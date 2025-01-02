extends Area2D

var player: Node = null
signal player_fell_in_killzone

func _ready() -> void:
	Gamemanager.connect("player_loaded", Callable(self, "on_player_loaded"))

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		emit_signal("player_fell_in_killzone")
	elif body.is_in_group("enemy"):
		body.queue_free()

func on_player_loaded(_player):
	player = Gamemanager.player
	if player.is_in_group("player"):
		connect("player_fell_in_killzone", Callable(player, "fell_into_killzone"))
