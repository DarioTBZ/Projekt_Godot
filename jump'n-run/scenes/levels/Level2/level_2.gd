extends Node2D

signal player_respawn

@onready var player: CharacterBody2D = $Player


@onready var death_screen: CanvasLayer = $DeathScreen

func _ready() -> void:
	connect("player_respawn", Callable(player, "respawn"))

func player_died():
	death_screen.visible = true
	

func respawn_player():
	death_screen.visible = false
	player.position = Vector2(156, 360)
	emit_signal("player_respawn")
