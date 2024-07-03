extends Node2D

@onready var main = get_node("/root/Main")
@onready var timer = $EnemySpawnTimer

var enemy_scene = preload("res://scenes/enemy.tscn")
var spawn_points = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)
			

func _on_enemy_spawn_timer_timeout():
	var spawn = spawn_points[randi() % spawn_points.size()]
	var enemy = enemy_scene.instantiate()
	enemy.position = spawn.position
	main.add_child(enemy)
	timer.wait_time *= 0.95


func random_spawn_region(region, region_x, region_y):
	var rng = RandomNumberGenerator.new()
	var half_size_x = region_x/2
	var half_size_y = region_y/2
	var random_x = rng.randf_range(region.global_position.x - half_size_x, region.global_position.x + half_size_x)
	var random_y = rng.randf_range(region.global_position.y - half_size_y, region.global_position.y + half_size_y)
	return Vector2(random_x, random_y)
