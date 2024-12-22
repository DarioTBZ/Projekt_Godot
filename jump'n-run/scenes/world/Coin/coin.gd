extends Area2D

@onready var animation = $AnimatedSprite2D
@onready var coin_sound = $AudioStreamPlayer

func _physics_process(_delta):
	animation.play("default")

func _on_body_entered(body):
	if body.is_in_group("player"):
		coin_sound.play()
		body.emit_signal("coin_collected")
		self.queue_free()
