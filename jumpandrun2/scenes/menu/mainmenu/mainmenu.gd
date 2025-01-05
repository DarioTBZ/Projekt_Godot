extends Control

var level_1_path = "res://scenes/level/level1/level_1.tscn"
var maintheme_music = load("res://assets/music/Maintheme.mp3")

func _ready() -> void:
	Play_Main_Title(maintheme_music)

func _GameStartButton_pressed() -> void:
	print("MainMenu: Level 1 gestartet")
	Gamemanager.load_level(level_1_path)
	queue_free()

func _SettingsButton_pressed() -> void:
	print("MainMenu: Settings Button pressed")

func _QuitButton_pressed() -> void:
	get_tree().quit()

func Play_Main_Title(music):
	if Musicplayer.is_main_playing():
		return
	else:
		Musicplayer.set_main_volume(-10)
		Musicplayer.play_main_music(music)
