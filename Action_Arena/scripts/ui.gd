extends Control

@onready var Ammo = $CanvasLayer/Ammo
@onready var Life = $CanvasLayer/Life
@onready var Reload = $CanvasLayer/Reload
@onready var Score = $CanvasLayer/Score
@onready var Cooldown = $Cooldown


var is_ready = null
var amount: int
var msize: int

# Called when the node enters the scene tree for the first time.
func _ready():
	Reload.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Score.text = str(Global.score)


func _on_gun_shot(mag_size, mag_amount):
	msize = mag_size
	amount = mag_amount
	Ammo.text = str(amount) + " / " + str(msize)



func _on_player_life(health):
	var tween = create_tween()
	tween.tween_property(Life, "value", health, 0.3)


func _on_gun_reloading(mag_amount, reload_cooldown):
	var tween = create_tween()
	amount = mag_amount
	Reload.show()
	Reload.value = 0.0
	tween.tween_property(Reload, "value", 100, 2)
	Cooldown.start(reload_cooldown)


func _on_cooldown_timeout():
	Ammo.text = str(amount) + " / " + str(msize)
	Reload.hide()



