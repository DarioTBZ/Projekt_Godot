extends Node2D

@onready var player: CharacterBody2D = null

var playerspawn: Vector2 = Vector2(230, 402)

func _ready() -> void:
	Gamemanager.connect("level_loaded", Callable(self, "on_level_loaded"))

func on_level_loaded():
	spawn_player()

func spawn_player():
	player.position = playerspawn
