extends Node

func save_settings():
	var config = ConfigFile.new()
	var resolution = DisplayServer.window_get_size()
	config.set_value("video", "resolution", resolution)
	var cam_zoom: Vector2
	if resolution == Vector2i(2560, 1440):
		cam_zoom = Vector2(3.0, 3.0)
	elif resolution == Vector2i(1920, 1080):
		cam_zoom = Vector2(2.0, 2.0)
	elif resolution == Vector2i(1280, 720):
		cam_zoom = Vector2(1.0, 1.0)
	elif resolution == Vector2i(800, 600):
		cam_zoom = Vector2(1.0, 1.0)
	else:
		print("Not working")
	config.set_value("video", "cam_zoom", cam_zoom)
	
	
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
