extends Marker2D

signal shot(ammo_in_magazine: String)
signal gun_reload(ammo_in_magazine: int, reloading: bool)
signal mag_size(magazine_size: String)


@export var magazine_size = 12

var reloading: bool
var ammo_in_magazine = 0
var reload_time = 3.0

@onready var reload_timer = %Reloading
@onready var bullet_scene = preload("res://scenens/bullet.tscn")

func _ready():
	mag_size.emit(magazine_size)
	ammo_in_magazine = magazine_size
	
func _physics_process(delta):
	if not reload_timer.is_stopped():
		reloading = false
		return
		
	if Input.is_action_just_pressed("shoot"):
		if ammo_in_magazine > 0:
			shoot()
		else:
			reload()
			
	elif Input.is_action_just_pressed("reload") and ammo_in_magazine < magazine_size:
		reload()
	

func reload():
	if ammo_in_magazine == magazine_size:
		reloading = false
		return
	
	reload_timer.start(3.0)
	
	reloading = true
	var reloaded_amount = magazine_size - ammo_in_magazine
	
	ammo_in_magazine += reloaded_amount
	gun_reload.emit(ammo_in_magazine, reloading)


func shoot():
	if ammo_in_magazine <= 0:
		return
	
	var bullet_inst = bullet_scene.instantiate()
	get_tree().root.add_child(bullet_inst)
	
	var move_direction = (get_global_mouse_position() - global_position).normalized()
	bullet_inst.move_direction = move_direction
	bullet_inst.global_position = global_position
	bullet_inst.rotation = move_direction.angle()
	
	ammo_in_magazine -= 1
	shot.emit(ammo_in_magazine)
	
