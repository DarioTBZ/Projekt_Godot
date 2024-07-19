extends CharacterBody2D
class_name Enemy

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var target = get_node("/root/Main/Player")
@onready var ray_cast_2d = $See
@onready var state_timer: Timer = $StateTimer
@onready var coin = preload("res://scenes/coin.tscn")

@export var speed: float
@export var enemy_health = 100
@export var enemy_damage = 31.0
@export var wander_range = 100.0
@export var idle_time_range: Vector2 = Vector2(3.0, 8.0)
@export var wander_time_range: Vector2 = Vector2(5.0, 10.0)

var player_chase = false
enum State { IDLE, CHASE, WANDER }
var current_state = State.IDLE

signal hit(enemy_health)
signal dead

func _ready():
	call_deferred("seeker_setup")
	state_timer = Timer.new()
	add_child(state_timer)
	state_timer.connect("timeout", Callable(self, "switch_state"))
	state_timer.set_one_shot(true)
	switch_to_idle()

func _physics_process(delta):
	match current_state:
		State.IDLE:
			pass
		State.CHASE:
			chase_target()
		State.WANDER:
			wander()

func chase_target():
	if target == null:
		switch_to_idle()
		return
	speed = 70
	navigation_agent.target_position = target.global_position
	look_at(target.global_position)
	move_towards_target()

func wander():
	if navigation_agent.is_navigation_finished():
		switch_to_idle()
	else:
		move_towards_target()

func move_towards_target():
	if navigation_agent.is_navigation_finished():
		return
	
	var current_agent_position = global_position
	var next_path_position = navigation_agent.get_next_path_position()
	velocity = current_agent_position.direction_to(next_path_position) * speed
	move_and_slide()
	look_at(next_path_position)

func switch_state():
	if current_state == State.IDLE:
		switch_to_wander()
	elif current_state == State.WANDER:
		switch_to_idle()

func switch_to_wander():
	current_state = State.WANDER
	speed = 50
	var random_position = Vector2(
		randf_range(-wander_range, wander_range),
		randf_range(-wander_range, wander_range)
	)
	var target_position = global_position + random_position
	navigation_agent.target_position = target_position
	state_timer.start(randf_range(wander_time_range.x, wander_time_range.y))

func switch_to_idle():
	current_state = State.IDLE
	velocity = Vector2.ZERO
	state_timer.start(randf_range(idle_time_range.x, idle_time_range.y))

func seeker_setup():
	await get_tree().physics_frame
	if target:
		navigation_agent.target_position = target.global_position

func take_damage(damage_per_bullet):
	enemy_health -= damage_per_bullet
	if enemy_health <= 0:
		die()

func die():
	var instance = coin.instantiate()
	var coin_collect = get_tree().get_nodes_in_group("items")[0]
	queue_free()
	instance.global_position = global_position
	coin_collect.add_child(instance)
	

func _on_detection_area_body_entered(body):
	if body is Player:
		player_chase = true
		target = body
		current_state = State.CHASE
		state_timer.stop()


func _on_detection_area_area_entered(area):
	if area is Bullet:
		player_chase = true
		current_state = State.CHASE
		state_timer.stop()
		


func _on_hit_box_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(enemy_damage)
