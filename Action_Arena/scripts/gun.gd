extends Area2D

@onready var Cooldown = $Cooldown

var mag_size = 12
var mag_amount = 12
var gun_ready = true
var fire_rate = 0.5
var reload_cooldown = 2

signal shot(mag_size, mag_amount)
signal reloading(mag_amount, reload_cooldown)


func _ready():
	shot.emit(mag_size, mag_amount)


func _physics_process(delta):
	if Input.is_action_just_pressed("reload") and mag_amount < mag_size:
		gun_ready = false
		Cooldown.start(reload_cooldown)
		reload()
	elif mag_amount > 0:
		if Input.is_action_just_pressed("shoot") and gun_ready:
			gun_ready = false
			Cooldown.start(fire_rate)
			shoot()
	elif mag_amount == 0:
		gun_ready = false
		Cooldown.start(reload_cooldown)
		reload()


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
	reloading.emit(mag_amount, reload_cooldown)


func _on_cooldown_timeout():
	gun_ready = true
