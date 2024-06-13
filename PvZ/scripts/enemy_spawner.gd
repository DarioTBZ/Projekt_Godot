extends Node2D

@onready var main = get_node("/root/Main")

var zombie_scene = preload("res://assets/charachters/zombie_1.png")
var spawners = []


func _ready():
	for i in get_children():
		if i is Marker2D:
			spawners.append(i)
			


func _on_timer_timeout():
	var spawn = spawners[randi() % spawners.size()]
	var zombie = zombie_scene.insteniate()
	zombie.position = spawn.position
	main.add_child(zombie)
