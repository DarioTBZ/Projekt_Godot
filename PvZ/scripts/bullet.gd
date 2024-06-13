extends Area2D

@export var speed = 250

var move_direction: Vector2 = Vector2.ZERO
var distance = 0

const range = 1000

func _physics_process(delta):
	global_position += move_direction * delta * speed
	
	distance += speed * delta
	if distance > range:
		queue_free()


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
