extends Area2D

signal player_fell_into_teleport_zone

@onready var level: Node = null

func _ready() -> void:
	level = get_node("/root/Level1")
	connect("player_fell_into_teleport_zone", Callable(level, "scary_zone_teleport_player"))

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("player_fell_into_teleport_zone")
