extends Node

signal level_loaded
# Gamemanager.connect("level_loaded", Callable(self, "on_level_loaded"))

var level_1_path: String = "res://scenes/level/level1/level_1.tscn"

@onready var current_level: Node = null
@onready var player: CharacterBody2D = null

func _ready() -> void:
	pass

func load_level(scene_path: String):
	if current_level:
		current_level.queue_free()
	current_level = load(scene_path).instantiate()
	call_deferred("add_child", current_level)
	player = current_level.get_node("Player")
	call_deferred("emit_signal", "level_loaded")
	print("Gamemanager: ",current_level, " geladen.")

func stop_level():
	current_level.queue_free()

func restart_level():
	if current_level:
		current_level.queue_free()
		load_level(current_level.scene_file_path)

func get_player():
	player = current_level.get_node("Player")
	return player

func get_level_1_path():
	return level_1_path
