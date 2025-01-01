extends Node2D

signal player_respawn

var horror_theme = load("res://assets/music/horror_background.wav")
var maintheme = load("res://scenes/sound/music/mainmenu-music.mp3")
var game_start: AudioStream = load("res://scenes/sound/levelstart/game_start_sound.mp3")

@onready var player: CharacterBody2D = $Player
@onready var player_ui: CanvasLayer = $PlayerUI
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var enemy_slime_green: CharacterBody2D = $Enemies/enemy_slime_green
@onready var enemy_slime_green_2: CharacterBody2D = $Enemies/enemy_slime_green2
@onready var enemy_slime_green_3: CharacterBody2D = $Enemies/enemy_slime_green3
@onready var enemy_slime_green_4: CharacterBody2D = $Enemies/enemy_slime_green4
@onready var coin_counter: CanvasLayer = %CoinCounter
@onready var death_screen: CanvasLayer = $DeathScreen


@onready var game_start_player = $GameStartSound


func _ready() -> void:
	game_start_player.stream = game_start
	game_start_player.play()
	modulate = Color(0.75, 0.75, 0.75, 1)
	player.position = Vector2(345.0, 382.0)
	animation_player.connect("ui_switch", Callable(player_ui, "switch_ui"))
	player_ui.connect("ui_switch_coin_counter", Callable(coin_counter, "ui_switch_coin_counter"))
	connect("player_respawn", Callable(player, "respawn"))
	
	if GlobalMusicPlayer.is_playing():
		GlobalMusicPlayer.set_volume(-5)
		return
	else:
		GlobalMusicPlayer.play_music(maintheme)
		GlobalMusicPlayer.set_volume(-5)

func respawn_player():
	player.position = Vector2(345.0, 382.0)
	emit_signal("player_respawn")
	death_screen.visible = false

func player_died():
	death_screen.visible = true


func _on_body_entered_creepyzone(_body: Node2D) -> void:
	modulate = Color(0.5, 0.5, 0.5, 1)

func scary_zone_teleport_player():
	player.position = Vector2(2261, 460)
