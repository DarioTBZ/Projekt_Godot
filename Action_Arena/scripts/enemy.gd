extends CharacterBody2D

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var target = get_node("/root/Main/Player")
@onready var Life = $EnemyUI/HealthBar


var speed = 100.0
var health = 100
var damage = 23.0

signal hit(health)
signal dead

func _ready():
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	call_deferred("wait_for_physics")

func wait_for_physics():
	await get_tree().physics_frame

func _physics_process(delta):
	if target:
		navigation_agent.target_position = target.global_position
	if navigation_agent.is_navigation_finished():
		return
	if health < 50:
		speed = 140

	var next_path_position = navigation_agent.get_next_path_position()
	var direction = global_position.direction_to(next_path_position).normalized()
	global_position += direction * delta * speed 
	
		
	move_and_slide()
	look_at(target.position)


func take_damage(damage):
	health -= damage
	Life.value = health
	hit.emit(health)
	
	if health <= 0:
		queue_free()
		Global.score += 1

func _on_damage_box_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
