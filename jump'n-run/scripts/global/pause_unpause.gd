extends Node

var is_paused:bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("PauseUnpause"):
		is_paused = !is_paused
		get_tree().paused = is_paused
