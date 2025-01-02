extends Control

var level_1_path = ""

func _GameStartButton_pressed() -> void:
	print("MainMenu: Start Level 1")
	#Gamemanager.load_level(level_1_path)



func _SettingsButton_pressed() -> void:
	print("MainMenu: Settings Button pressed")



func _QuitButton_pressed() -> void:
	get_tree().quit()
