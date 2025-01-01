extends Node

var creepy_theme = load("res://assets/music/horror_background.wav")
@onready var area_2d: Area2D = $Area2D
@onready var area_2d_2: Area2D = $Area2D2
@onready var area_2d_3: Area2D = $Area2D3
@onready var area_2d_4: Area2D = $Area2D4
@onready var sound_lauter: Area2D = $SoundLauter


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalMusicPlayer.set_volume(-8)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalMusicPlayer.set_volume(-12)

func _on_body_entered_phase2(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalMusicPlayer.set_volume(-22)

func _on_body_entered_phase3(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalMusicPlayer.main_pause_player(true)
		GlobalMusicPlayer.scnd_set_volume(9)
		GlobalMusicPlayer.scnd_play_music(creepy_theme)

func _on_sound_lauter_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GlobalMusicPlayer.set_volume(-5)

func on_animation_finished():
	area_2d.call_deferred("set", "monitoring", false)
	area_2d_2.call_deferred("set", "monitoring", false)
	area_2d_3.call_deferred("set", "monitoring", false)
	area_2d_4.call_deferred("set", "monitoring", false)
