extends CharacterBody2D

@onready var player = get_node("/root/main/Player")

var health = 3

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 200 
	move_and_slide()
	
	look_at(player.position)
	
func take_damage():
	health -= 1
	if health == 0:
		queue_free()
