extends Area2D

@onready var animation = $AnimatedSprite2D
@onready var coin_sound = $AudioStreamPlayer

func _physics_process(_delta):
	animation.play("default")

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.emit_signal("coin_collected")
		visible = false
		coin_sound.play()


func _on_audio_finished() -> void:
	queue_free()
