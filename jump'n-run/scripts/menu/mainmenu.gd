extends Control

var maintheme = load("res://sound/menu/mainmenu-music.mp3")
var minus_dezibel = -5

func _ready():
	GlobalMusicPlayer.set_volume(minus_dezibel)
	GlobalMusicPlayer.play_music(maintheme)


func gamestart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")



func quit_button_pressed() -> void:
	get_tree().quit()
