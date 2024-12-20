extends Area2D

@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	animation.play("default")

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("+1 coin")
