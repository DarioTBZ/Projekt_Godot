extends CanvasLayer

var player: CharacterBody2D = null

func _ready() -> void:
	visible = false
	
	player = get_parent()

func _on_gamestart_button() -> void:
	Gamemanager.restart_level()

func _on_mainmenu_button() -> void:
	visible = false
	get_tree().change_scene_to_file("res://scenes/menu/mainmenu/mainmenu.tscn")
