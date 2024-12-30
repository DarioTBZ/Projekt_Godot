extends Control

@onready var option_button = $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton

func _ready() -> void:
	var window_size = DisplayServer.window_get_size()
	match window_size:
		Vector2i(2560, 1440):
			option_button.select(0)
		Vector2i(1920, 1080):
			option_button.select(1)
		Vector2i(1280, 720):
			option_button.select(2)
		Vector2i(800, 600):
			option_button.select(3)


func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(2560, 1440))
		1:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))
		3:
			DisplayServer.window_set_size(Vector2i(800, 600))



func _on_submit_pressed() -> void:
	var selected_index = option_button.get_selected_id()
	_on_option_button_item_selected(selected_index)
	Settings.save_settings()
	Settings.center_window()


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/Mainmenu/mainmenu.tscn")
