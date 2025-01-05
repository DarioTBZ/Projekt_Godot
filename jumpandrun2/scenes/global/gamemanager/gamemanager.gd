extends Node

signal level_loaded
# Gamemanager.connect("level_loaded", Callable(self, "on_level_loaded"))

@onready var current_level: Node = null

@onready var player: Node = null

func _ready() -> void:
	pass

func load_level(scene_path: String):
	if current_level:
		current_level.queue_free()
	current_level = load(scene_path).instantiate()
	call_deferred("add_child", current_level)
	player = current_level.get_node("Player")
	emit_signal("level_loaded")
	print("Gamemanager: ",current_level, " geladen.")

func restart_level():
	if current_level:
		load_level(current_level.scene_file_path)
