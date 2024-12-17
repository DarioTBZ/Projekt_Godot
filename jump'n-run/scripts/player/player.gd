extends CharacterBody2D

signal fell_into_killzone

@export var speed := 200
@export var jump_force := -400
@export var gravity := 980
@export var acceleration := 800
@export var friction := 1200
@export var max_jumps := 1
var jumps_available := max_jumps

@onready var sprite = $AnimatedSprite2D

func _ready() -> void:
	connect("fell_into_killzone", Callable(self, "_on_fall_into_killzone"))
	
	create_player_camera()

func _physics_process(delta: float):
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
		
	if Input.is_action_just_pressed("jump") and jumps_available > 0:
		velocity.y = jump_force
		jumps_available -= 1
		

	move_and_slide()
		
		
func _on_fall_into_killzone():
	get_tree().change_scene_to_file("res://scenes/menu/death_screen.tscn")
	
func create_player_camera():
	var camera = Camera2D.new()
	
	camera.anchor_mode = Camera2D.ANCHOR_MODE_DRAG_CENTER
	camera.ignore_rotation = true
	camera.enabled = true
	camera.zoom = Vector2(2, 2)
	camera.process_callback = Camera2D.Camera2DProcessCallback.CAMERA2D_PROCESS_IDLE
	
	camera.limit_bottom = 900
	
	camera.position_smoothing_enabled = true
	camera.position_smoothing_speed = 5.0
	
	add_child(camera)
	camera.make_current()
