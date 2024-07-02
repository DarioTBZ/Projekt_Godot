extends CharacterBody2D

@export var speed: float = 170
@export var rotation_speed: float = 10

var health = 100.0


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	look_at(get_global_mouse_position())
	move_and_slide()
	

func take_damage(damage):
	health -= damage
	
	if health <= 0:
		get_tree().quit()


