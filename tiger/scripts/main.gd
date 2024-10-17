extends Node2D

var inventory_ui

func _ready():
	inventory_ui = $player/inventory
	inventory_ui.visible = false
	
func _process(_delta):
	if Input.is_action_just_pressed("open_inventory"):
		toggle_inventory()

func toggle_inventory():
	if inventory_ui.visible:
		inventory_ui.visible = false
	else:
		inventory_ui.visible = true
