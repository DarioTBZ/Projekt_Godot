extends CanvasLayer

signal respawn_player
@onready var level: Node = null

func _ready() -> void:
	level = Gamemanager.current_level
	print(level)
	visible = false
	connect("respawn_player", Callable(level, "respawn_player"))

func _on_game_start_button_pressed() -> void:
	emit_signal("respawn_player")



func _on_mainmenu_button_pressed() -> void:
	visible = false
	get_tree().change_scene_to_file("res://scenes/menu/Mainmenu/mainmenu.tscn")

func _process(_delta: float) -> void:
	if visible:
		if Input.is_action_just_pressed("Respawn"):
			_on_game_start_button_pressed()
