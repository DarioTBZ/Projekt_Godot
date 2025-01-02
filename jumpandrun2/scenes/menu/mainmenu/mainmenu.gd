extends Control

var level_1_path = "res://scenes/level/level1/level_1.tscn"

func _GameStartButton_pressed() -> void:
	print("MainMenu: Level 1 gestartet")
	Gamemanager.load_level(level_1_path)
	queue_free()



func _SettingsButton_pressed() -> void:
	print("MainMenu: Settings Button pressed")



func _QuitButton_pressed() -> void:
	get_tree().quit()
