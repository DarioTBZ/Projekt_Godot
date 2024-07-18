extends Node

var paused = false

func _ready():
	self.visible = false
	
func _process(delta):
	check_input()

func resume():
	get_tree().paused = false
	self.visible = false

func pause():
	get_tree().paused = true
	self.visible = true


func check_input():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused == true:
		resume()


func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()


func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
