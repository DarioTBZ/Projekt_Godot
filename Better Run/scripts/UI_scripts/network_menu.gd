extends CanvasLayer

var multiplayer_peer = ENetMultiplayerPeer.new()
const PORT = 9999
const ADDRESS = "localhost"

func _host_button_pressed():
	multiplayer_peer.peer_connected.connect(
		func(new_peer_id):
			await get_tree().create_timer(1).timeout
			rpc("add_newly_connected_player_character")
	)

func _join_button_pressed():
	multiplayer_peer.create_client(ADDRESS, PORT)
	multiplayer.multiplayer_peer = multiplayer_peer
