extends Area2D

@onready var animation = $AnimatedSprite2D
@onready var coin_sound = $AudioStreamPlayer
var is_collected = false

func _physics_process(_delta):
	if is_collected:
		return
	
	animation.play("default")

func _on_body_entered(body):
	if is_collected:
		return
	
	if body.is_in_group("player"):
		is_collected = true
		coin_sound.play()
		body.emit_signal("coin_collected")
		visible = false


func _on_audio_finished() -> void:
	queue_free()
