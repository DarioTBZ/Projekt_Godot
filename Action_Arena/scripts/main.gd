extends Node2D

@onready var Locked = $NavigationRegion2D/TileMap/Area2D/Locked
var paused = false

func _process(_delta):
	if Global.score >= 10:
		Locked.text = "UNLOCKED"
