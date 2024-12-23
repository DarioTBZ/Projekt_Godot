extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var player_ui: CanvasLayer = $PlayerUI
@onready var enemy_slime_green: CharacterBody2D = $enemy_slime_green
@onready var death_screen: CanvasLayer = %DeathScreen


func _ready() -> void:
	player.connect("health_changed", Callable(player_ui, "update_health_bar"))
	enemy_slime_green.connect("make_damage", Callable(player, "take_damage"))
	player.connect("died", Callable(self, "player_died"))

func player_died():
	death_screen.visible = true
