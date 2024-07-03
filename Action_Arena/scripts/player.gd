extends CharacterBody2D

@export var speed: float = 170
@export var rotation_speed: float = 10

var health = 100.0

signal life(health)

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	look_at(get_global_mouse_position())
	move_and_slide()
	

func take_damage(enemy_damage):
	health -= enemy_damage
	life.emit(health)
	
	if health <= 0:
		get_tree().quit()


func _on_area_2d_body_entered(body):
	if Global.score >= 10 and body is CharacterBody2D:
		get_tree().quit()
