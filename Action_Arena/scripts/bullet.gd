extends Area2D

class_name Bullet

var speed = 400
var damage = 25

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(damage)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()