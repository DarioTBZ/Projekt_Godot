extends Node2D

var multiplayer_peer = ENetMultiplayerPeer.new()
const PORT = 9999
const ADDRESS = "localhost"

@onready var network_menu = $NetworkMenu

func add_player():
	var player = preload("res://scenes/player/player.tscn").instantiate()
	add_child(player)	
func add_newly_connected_player_character():
	add_player()


func _input(event):
	if Input.is_action_just_pressed("network_menu"):
		if network_menu.visible == true:
			network_menu.visible = false
		else:
			network_menu.visible = true
