extends CanvasLayer

func _ready() -> void:
	visible = false

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu/Mainmenu/mainmenu.tscn")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("PauseUnpause"):
		if visible == false:
			visible = true
		else:
			visible = false
