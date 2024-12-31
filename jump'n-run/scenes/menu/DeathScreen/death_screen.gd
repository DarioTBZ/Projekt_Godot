extends CanvasLayer

signal respawn_player
@onready var level: Node = null

func _ready() -> void:
	level = get_node("/root/Level1")
	visible = false
	connect("respawn_player", Callable(level, "respawn_player"))

func _on_game_start_button_pressed() -> void:
	emit_signal("respawn_player")



func _on_mainmenu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/Mainmenu/mainmenu.tscn")
