extends CanvasLayer


func _on_game_start_button_pressed() -> void:
	visible = false
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_mainmenu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/mainmenu.tscn")
