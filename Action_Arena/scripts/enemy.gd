extends CharacterBody2D

class_name Enemy

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var player_to_chase: CharacterBody2D

var speed = 100.0
var player_chase = null
var health = 100
var damage = 35.0
var rotation_speed: float

func _ready():
	set_physics_process(false)
	call_deferred("wait_for_physics")

func _physics_process(delta):
	if player_chase:
		if navigation_agent.is_navigation_finished() and player_to_chase.global_position == navigation_agent.target_position:
			return
		navigation_agent.target_position = player_to_chase.global_position
		velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * speed
		look_at(player_to_chase.position)
		move_and_slide()

func wait_for_physics():
	await get_tree().physics_frame
	set_physics_process(true)

func take_damage(damage):
	health -= damage
	
	if health <= 0:
		queue_free()
		

func _on_damage_box_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)

func _on_detection_area_body_entered(body):
	player_to_chase = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player_to_chase = null
	player_chase = false
