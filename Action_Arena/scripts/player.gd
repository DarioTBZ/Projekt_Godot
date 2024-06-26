extends CharacterBody2D

@export var speed: float = 170
@export var rotation_speed: float = 10

var angle


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	angle = (get_global_mouse_position() - global_position).angle()
	if angle:
		global_rotation = lerp_angle(global_rotation, angle, delta * rotation_speed)
	
	move_and_slide()
