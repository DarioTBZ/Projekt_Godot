extends Node2D

@onready var player: CharacterBody2D = null

var playerspawn: Vector2 = Vector2(230, 402)

func _ready() -> void:
	Gamemanager.connect("level_loaded", Callable(self, "on_level_loaded"))

func on_level_loaded():
	player = Gamemanager.get_player()
	spawn_player(player)

func spawn_player(p_player):
	if p_player == null:
		p_player = Gamemanager.get_player()
	elif p_player != null:
		p_player.position = playerspawn
	else: print("Level 1: Error with Player")

func respawn_player():
	player = Gamemanager.get_player()
	spawn_player(player)
