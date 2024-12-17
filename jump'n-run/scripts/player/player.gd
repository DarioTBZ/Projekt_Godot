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
	get_tree().paused = true
	print("Tod Menu kommt hier")
