extends Node2D

var horror_theme = load("res://assets/music/horror_background.wav")
var maintheme = load("res://scenes/sound/music/mainmenu-music.mp3")
@onready var player: CharacterBody2D = $Player
@onready var player_ui: CanvasLayer = $PlayerUI
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var enemy_slime_green: CharacterBody2D = $Enemies/enemy_slime_green
@onready var enemy_slime_green_2: CharacterBody2D = $Enemies/enemy_slime_green2
@onready var enemy_slime_green_3: CharacterBody2D = $Enemies/enemy_slime_green3
@onready var enemy_slime_green_4: CharacterBody2D = $Enemies/enemy_slime_green4
@onready var coin_counter: CanvasLayer = %CoinCounter
@onready var death_screen: CanvasLayer = %DeathScreen


func _ready() -> void:
	modulate = Color(0.75, 0.75, 0.75, 1)
	player.position = Vector2(345.0, 382.0)
	player.connect("health_changed", Callable(player_ui, "update_health_bar"))
	animation_player.connect("ui_switch", Callable(player_ui, "switch_ui"))
	player_ui.connect("ui_switch_coin_counter", Callable(coin_counter, "ui_switch_coin_counter"))
	
	if GlobalMusicPlayer.is_playing():
		GlobalMusicPlayer.set_volume(-5)
		return
	else:
		GlobalMusicPlayer.play_music(maintheme)
		GlobalMusicPlayer.set_volume(-5)


func player_died():
	death_screen.visible = true


func _on_body_entered_creepyzone(_body: Node2D) -> void:
	modulate = Color(0.5, 0.5, 0.5, 1)
