extends AnimationPlayer

@onready var area_2d: Area2D = $Area2D
@onready var camera: Camera2D = $Camera2D

func _ready() -> void:
	camera.enabled = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		play("MeetCreature")


func _on_animation_finished(anim_name: StringName) -> void:
	area_2d.monitoring = false
	GlobalMusicPlayer.scnd_stop_music()
