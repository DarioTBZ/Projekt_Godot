extends Area2D


func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	
func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation	
	%ShootingPoint.add_child(new_bullet)
