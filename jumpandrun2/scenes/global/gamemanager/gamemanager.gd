extends Node

@onready var current_level: Node = null

func _ready() -> void:
	pass

func load_level(scene_path: String):
	if current_level:
		current_level.queue_free()
	current_level = load(scene_path).instantiate()
	call_deferred("add_child", current_level)
	print("Level geladen: ", scene_path)

func restart_level():
	if current_level:
		load_level(current_level.scene_file_path)
