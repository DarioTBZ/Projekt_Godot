extends Area2D

signal player_fell_in_killzone

var player: CharacterBody2D = null

func _ready() -> void:
	Gamemanager.connect("level_loaded", Callable(self, "on_level_loaded"))

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("player_fell_in_killzone")

func on_level_loaded():
	player = Gamemanager.get_player()
	connect("player_fell_in_killzone", Callable(player, "on_player_fell_in_killzone"))
