extends Control



func _quit_button_pressed():
	get_tree().quit()


func _play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
 
