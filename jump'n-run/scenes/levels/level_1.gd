extends Node2D

var maintheme = load("res://scenes/sound/music/mainmenu-music.mp3")
@onready var player: CharacterBody2D = $Player
@onready var player_ui: CanvasLayer = $PlayerUI

@onready var enemy_slime_green: CharacterBody2D = $Enemies/enemy_slime_green
@onready var enemy_slime_green_2: CharacterBody2D = $Enemies/enemy_slime_green2
@onready var enemy_slime_green_3: CharacterBody2D = $Enemies/enemy_slime_green3
@onready var enemy_slime_green_4: CharacterBody2D = $Enemies/enemy_slime_green4

@onready var death_screen: CanvasLayer = %DeathScreen


func _ready() -> void:
	player.connect("health_changed", Callable(player_ui, "update_health_bar"))
	player.connect("died", Callable(self, "player_died"))
	
	enemy_slime_green.connect("make_damage", Callable(player, "take_damage"))
	enemy_slime_green_2.connect("make_damage", Callable(player, "take_damage"))
	enemy_slime_green_3.connect("make_damage", Callable(player, "take_damage"))
	enemy_slime_green_4.connect("make_damage", Callable(player, "take_damage"))
	
	if GlobalMusicPlayer.is_playing():
		return
	else:
		GlobalMusicPlayer.play_music(maintheme)

func player_died():
	death_screen.visible = true
