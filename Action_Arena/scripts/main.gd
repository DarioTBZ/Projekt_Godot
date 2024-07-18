extends Node2D

@onready var Locked = $NavigationRegion2D/TileMap/Area2D/Locked
@onready var player = get_tree().get_first_node_in_group("player")
@onready var deathscreen = $UI/Deathscreen
@onready var canvas_modulate = $CanvasModulate
@onready var world_environment = $WorldEnvironment


func _ready():
	player.died.connect(game_over)

func _process(_delta):
	if Global.coins >= 7:
		Locked.text = "UNLOCKED"

func game_over():
	await get_tree().create_timer(1.5).timeout
	canvas_modulate.visible = false
	world_environment.queue_free()
	deathscreen.visible = true
