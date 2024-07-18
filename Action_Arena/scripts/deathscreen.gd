extends Control
class_name Deathscreen

@onready var score = $Score
@onready var hi_score = $HiScore

func _ready():
	self.visible = false

func score_system(coin_amount, high_score):
	score.text = "score: " + str(coin_amount)
	hi_score.text = "high-score: " + str(high_score)


func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_player_died(coin_amount, high_score):
	score_system(coin_amount, high_score)
	self.visible = true
