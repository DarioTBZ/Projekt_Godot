extends Control

var multiplayer_peer = ENetMultiplayerPeer.new()

const PORT = 9999
const ADDRESS = "localhost"

func _host_button_pressed():
	multiplayer_peer.create_server(PORT)
	multiplayer.multiplayer_peer = multiplayer_peer


func _join_button_pressed():
	pass # Replace with function body.
