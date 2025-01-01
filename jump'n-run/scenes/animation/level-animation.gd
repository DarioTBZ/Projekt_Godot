extends AnimationPlayer

signal ui_switch
signal disable_music_switch

@onready var area_2d: Area2D = $Area2D
@onready var camera: Camera2D = $Camera2D

@onready var music_change: Node = null

func _ready() -> void:
	music_change = get_node("/root/Level1/MusicChange")
	
	connect("disable_music_switch", Callable(music_change, "on_animation_finished"))
	
	camera.enabled = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		play("MeetCreature")
		emit_signal("ui_switch")



func _on_animation_finished(_anim_name: StringName) -> void:
	area_2d.monitoring = false
	GlobalMusicPlayer.scnd_set_volume(-10)
	emit_signal("ui_switch")
	emit_signal("disable_music_switch")
