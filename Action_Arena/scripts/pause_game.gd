extends Node

var paused = false
@onready var pause_screen = %PauseScreen

func _process(_delta):
		# Pause the Game
	if Input.is_action_just_pressed("pause"):
		if paused == true:
			paused = false
			get_tree().paused = false
			pause_screen.visible = false
		else:
			get_tree().paused = true
			paused = true
			pause_screen.visible = true

