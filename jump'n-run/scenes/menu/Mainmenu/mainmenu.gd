extends Control

var maintheme = load("res://scenes/sound/music/mainmenu-music.mp3")
var minus_dezibel = -5
var level1_scene: PackedScene

func _ready():
	level1_scene = preload("res://scenes/levels/level_1.tscn")
	GlobalMusicPlayer.set_volume(minus_dezibel)
	GlobalMusicPlayer.play_music(maintheme)


func gamestart_button_pressed() -> void:
	get_tree().change_scene_to_packed(level1_scene)



func quit_button_pressed() -> void:
	get_tree().quit()


func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/SettingsMenu/settings.tscn")
