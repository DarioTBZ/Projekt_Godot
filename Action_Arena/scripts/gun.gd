extends Area2D

var mag_size = 12
var mag_amount = 12

signal shot(mag_size, mag_amount)

func _physics_process(delta):
	if Input.is_action_just_pressed("reload"):
		reload()
	if mag_amount > 0:
		if Input.is_action_just_pressed("shoot"):
			shoot()
	elif mag_amount == 0:
		return

		
	
func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation	
	%ShootingPoint.add_child(new_bullet)
	mag_amount -= 1
	shot.emit(mag_size, mag_amount)


func reload():
	mag_amount = mag_size
