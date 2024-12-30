extends Node

var creepy_theme = load("res://assets/music/horror_background.wav")

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
