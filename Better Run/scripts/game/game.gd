extends Node2D

func add_player():
	var player = preload("res://scenes/player/player.tscn").instantiate()
	add_child(player)

func _enter_tree():
	add_player()
