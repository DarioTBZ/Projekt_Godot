extends CharacterBody2D

class_name Player

signal dead 

@export var speed: float = 50
@export var rotation_speed: float = 10

var health = 100.0
var angle
var direction: Vector2
var input: Vector2 = Vector2.ZERO

@onready var end_of_gun = $ShootingSystem

func _ready():
	$CanvasLayer/UI/MaxBullets

func _physics_process(delta):
	#Movement
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	direction = direction.normalized()
	angle = (get_global_mouse_position() - global_position).angle()


	if direction:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
		
	if angle:
		global_rotation = lerp_angle(global_rotation, angle, delta * rotation_speed)
	
	move_and_slide()
	
	const damage_rate = 10.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= damage_rate * overlapping_mobs.size() * delta
		if health <= 0.0:
			dead.emit()
			
		
