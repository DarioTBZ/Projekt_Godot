extends Node

signal player_loaded

var player_ui: CanvasLayer = null

var current_level: Node = null
var player: Node = null

func load_level(level_path: String):
	current_level = load(level_path).instantiate()
	call_deferred("add_child", current_level)
	player = current_level.get_node("Player")
	call_deferred("emit_signal", "player_loaded", player)
	load_all_nodes()
	

func load_all_nodes():
	player_ui = current_level.get_node("PlayerUI")
