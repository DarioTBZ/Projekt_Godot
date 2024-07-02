extends CharacterBody2D

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var timer = $MovementTimer
@onready var target = get_node("/root/Main/Player")

var speed = 100.0
var health = 100
var damage = 35.0

signal hit()

func _ready():
	call_deferred("wait_for_physics")

func wait_for_physics():
	await get_tree().physics_frame
	if target:
		navigation_agent.target_position = target.global_position

func _physics_process(delta):
	if target:
		navigation_agent.target_position = target.global_position
	if navigation_agent.is_navigation_finished():
		return
		
	var current_agent_position = global_position
	var next_path_position = navigation_agent.get_next_path_position()
	var new_velocity = current_agent_position.direction_to(next_path_position) * speed
	
	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(new_velocity)
	
	move_and_slide()
	look_at(target.position)

func take_damage(damage):
	health -= damage
	hit.emit()
	
	if health <= 0:
		queue_free()

func _on_damage_box_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)

func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
