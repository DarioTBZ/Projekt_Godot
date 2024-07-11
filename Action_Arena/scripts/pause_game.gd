extends Node

var paused = false

func _process(_delta):
		# Pause the Game
	if Input.is_action_just_pressed("pause"):
		if paused == true:
			paused = false
			get_tree().paused = false
		else:
			get_tree().paused = true
			paused = true
