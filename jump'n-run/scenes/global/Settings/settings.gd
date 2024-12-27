extends Node

func save_settings():
	var config = ConfigFile.new()
	config.set_value("video", "resolution", DisplayServer.window_get_size())
	config.save("user://settings.cfg")

func load_settings():
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		var resolution = config.get_value("video", "resolution", Vector2i(1280, 720))
		DisplayServer.window_set_size(resolution)

func center_window():
	var current_screen = DisplayServer.window_get_current_screen()
	var screen_position = DisplayServer.screen_get_position(current_screen)
	var screen_size = DisplayServer.screen_get_size(current_screen)
	var window_size = DisplayServer.window_get_size()
	
	var new_position = screen_position + (screen_size - window_size) / 2
	DisplayServer.window_set_position(new_position)
