extends Area2D

@onready var Cooldown = $Cooldown
@onready var shooting_point = $ShootingPoint

var ammo: int = 35
var mag_size: int = 20
var mag_amount: int = 20
var gun_ready = true

var fire_rate = 0.06
var reload_cooldown = 2

const BULLET = preload("res://scenes/bullet.tscn")

signal shot(mag_size, mag_amount, ammo)
signal reloading(mag_amount, reload_cooldown, ammo)
signal refill(ammo)

func _ready():
	shot.emit(mag_size, mag_amount, ammo)


func _physics_process(delta):
	if Input.is_action_just_pressed("reload"):
		reload()
	if Input.is_action_pressed("shoot") and gun_ready:
		shoot()


func shoot():
	if mag_amount == 0:
		reload()
		return
	
	var new_bullet = BULLET.instantiate()
	gun_ready = false
	mag_amount -= 1
	
	Cooldown.start(fire_rate)
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation	
	shooting_point.add_child(new_bullet)
	shot.emit(mag_size, mag_amount, ammo)


func reload():
	if ammo == 0 or mag_amount == mag_size:
		return

	var ammo_missing = mag_size - mag_amount
	gun_ready = false
	
	Cooldown.start(reload_cooldown)
	
	if ammo >= ammo_missing:
		mag_amount += ammo_missing
		ammo -= ammo_missing
	elif ammo < ammo_missing:
		mag_amount += ammo
		ammo = 0
	
	reloading.emit(mag_amount, reload_cooldown, ammo)

func refill_ammo(ammo_amount, item):
	ammo += ammo_amount
	refill.emit(ammo)
	item.queue_free()

func _on_cooldown_timeout():
	gun_ready = true
