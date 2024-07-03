extends Node2D

@onready var Locked = $NavigationRegion2D/TileMap/Area2D/Locked

func _process(delta):
	if Global.score >= 10:
		Locked.text = "UNLOCKED"
