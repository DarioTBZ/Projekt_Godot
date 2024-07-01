extends Node2D

@onready var main = get_node("/root/Main")

var enemy_scene = preload("res://scenes/enemy.tscn")
var spawn_points = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)
			

func _on_enemy_spawn_timer_timeout():
	var spawn = Vector2(rand_range)
	var enemy = enemy_scene.instantiate()
	enemy.position = spawn.position
	main.add_child(enemy)
