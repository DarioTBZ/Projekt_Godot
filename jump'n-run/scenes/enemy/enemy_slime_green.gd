extends CharacterBody2D

signal make_damage(amount: float)

var is_dead = false
@onready var sprite = $AnimatedSprite2D
@export var speed: float = 100.0
var direction: int = -1
var damage:float = 20.0

var gravity: float = 980.0
var max_fall_speed: float = 980.0

func _physics_process(_delta: float) -> void:
	if is_dead:
		return
	
	velocity.y = gravity
	
	velocity.x = speed * direction
	
	move_and_slide()
	
	if is_on_wall():
		direction *= -1

func _on_damage_region_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if is_dead == false:
			emit_signal("make_damage", damage)
		else:
			return


func _on_die_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_dead = true
		sprite.play("die")

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
