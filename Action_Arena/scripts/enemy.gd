extends CharacterBody2D

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@export var player_to_chase: CharacterBody2D

var speed = 100.0

func _ready():
	set_physics_process(false)
	call_deferred("wait_for_physics")

func _physics_process(delta):
	if navigation_agent.is_navigation_finished() and player_to_chase.global_position == navigation_agent.target_position:
		return
	navigation_agent.target_position = player_to_chase.global_position
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * speed
	move_and_slide()

func wait_for_physics():
	await get_tree().physics_frame
	set_physics_process(true)

func _on_detection_area_body_entered(body):
	pass
