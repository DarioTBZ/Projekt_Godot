extends Control

@onready var Ammo = $CanvasLayer/Ammo

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_gun_shot(mag_size, mag_amount):
	Ammo.text = str(mag_amount) + "/" + str(mag_size)
