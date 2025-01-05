extends CharacterBody2D


@export var speed := 200
@export var jump_force := -400
@export var gravity := 980
@export var acceleration := 800
@export var friction := 1200
@export var max_jumps := 1
var jumps_available := max_jumps


@onready var camera: Camera2D = $Camera2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var hurt_sound: AudioStreamPlayer2D = $HurtSound
@onready var death_sound: AudioStreamPlayer2D = $DeathSound


var is_in_animation = false
var is_dead: bool = false

@onready var level: Node = null

func _ready() -> void:
	# Cam Setup from User File
	var cam_zoom: Vector2
	var config = ConfigFile.new()
	if config.load("user://settings.cfg") == OK:
		cam_zoom = config.get_value("video", "cam_zoom", Vector2(2, 2))
	camera.zoom = cam_zoom

func _physics_process(delta: float):
	if is_dead:
		return
	if is_in_animation == false && camera.enabled == false:
		camera.enabled = true
	if is_in_animation:
		camera.enabled = false
		return
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
		sprite.play("run")
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		sprite.play("idle")
		
	if is_on_floor():
		jumps_available = max_jumps
		
	if Input.is_action_just_pressed("jump") and jumps_available > 0 and is_in_animation == false:
		jump_sound.play()
		velocity.y = jump_force
		jumps_available -= 1

	move_and_slide()
