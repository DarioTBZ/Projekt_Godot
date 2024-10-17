extends CharacterBody2D

@export var SPEED: float = 200.0
var input_direction: Vector2
@onready var animated_sprite = $AnimatedSprite2D
var last_direction: Vector2 = Vector2.UP
var is_attacking: bool = false


func _process(_delta):
	handle_input()
	move_character()
	update_animation()
	
func handle_input():
	input_direction = Vector2.ZERO
	
	if not is_attacking:	
		if Input.is_action_pressed("right"):
			input_direction.x += 1
		if Input.is_action_pressed("left"):
			input_direction.x -= 1
		if Input.is_action_pressed("down"):
			input_direction.y += 1
		if Input.is_action_pressed("up"):
			input_direction.y -= 1
	
func move_character():
	input_direction = input_direction.normalized()
	velocity = input_direction * SPEED
	move_and_slide()
	
	
func update_animation():
	if is_attacking:
		handle_attack_animation()
		return
		
	if input_direction != Vector2.ZERO:
		last_direction = input_direction
		play_movement_animation()
	else:
		play_idle_animation()
		
	handle_attack_input()
	
	
func play_movement_animation():
	if input_direction.x != 0:
		animated_sprite.play("walk_side")
		animated_sprite.flip_h = input_direction.x < 0
	elif input_direction.y > 0:
		animated_sprite.play("walk_back")
	elif input_direction.y < 0:
		animated_sprite.play("walk_up")
	
	if input_direction != Vector2.ZERO and not is_attacking:
		last_direction = input_direction
		
func play_idle_animation():
	if last_direction.y < 0:
		animated_sprite.play("idle_back")
	elif last_direction.y > 0:
		animated_sprite.play("idle_front")
	else:
		animated_sprite.play("idle_side")
		animated_sprite.flip_h = last_direction.x < 0

func handle_attack_input():
	if Input.is_action_just_pressed("attack") and not is_attacking:
		is_attacking = true
		if last_direction.y < 0:
			animated_sprite.play("attack_up")
		elif last_direction.y > 0:
			animated_sprite.play("attack_down")
		elif last_direction.x != 0:
			animated_sprite.flip_h = last_direction.x < 0
			animated_sprite.play("attack_side")

func handle_attack_animation():
	if is_attacking:
		if not animated_sprite.is_playing():
			is_attacking = false
		return
