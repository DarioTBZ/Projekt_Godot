extends Node

signal player_loaded

var current_level: Node = null
var player: Node = null

func load_level(level_path: String):
	current_level = load(level_path).instantiate()
	add_child(current_level)
	player = current_level.get_node("Player")
	emit_signal("player_loaded", player)
	load_all_nodes()
	

func load_all_nodes():
	var player_ui: Node = current_level.get_node("PlayerUI")
	var music_change: Node = current_level.get_node("MusicChange")
