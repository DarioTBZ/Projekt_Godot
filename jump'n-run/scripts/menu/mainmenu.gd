extends Control

var maintheme = load("res://assets/music/time_for_adventure.mp3")

func ready():
	GlobalMusicPlayer.set_volume(0)
	GlobalMusicPlayer.play_music(maintheme)


func gamestart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")



func quit_button_pressed() -> void:
	get_tree().quit()
