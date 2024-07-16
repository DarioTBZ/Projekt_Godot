extends CanvasLayer



func startgamebutton_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")



func quitbutton_pressed():
	# Quit Game
	get_tree().quit()
