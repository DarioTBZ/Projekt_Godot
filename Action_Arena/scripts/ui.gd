extends Control

@onready var Ammo = $Interface/Ammo
@onready var Life = $Interface/Life
@onready var Reload = $Interface/Reload
@onready var Score = $Interface/Score
@onready var Cooldown = $Cooldown
@onready var Coins = $Interface/Coins


var is_ready = null
var amount: int
var msize: int
var reserve: int
var coins: int

func _ready():
	Coins.text = "x" + str(coins)
	Reload.hide()


func _on_gun_shot(mag_size, mag_amount, ammo):
	msize = mag_size
	amount = mag_amount
	reserve = ammo
	Ammo.text = str(amount) + " / " + str(reserve)

func _on_player_life(current_health):
	var tween = create_tween()
	tween.tween_property(Life, "value", current_health, 0.3)


func _on_gun_reloading(mag_amount, reload_cooldown, ammo):
	var tween = create_tween()
	amount = mag_amount
	reserve = ammo
	Reload.show()
	Reload.value = 0.0
	tween.tween_property(Reload, "value", 100, 2)
	Cooldown.start(reload_cooldown)


func _on_cooldown_timeout():
	Ammo.text = str(amount) + " / " + str(reserve)
	Reload.hide()


func _on_gun_refill(ammo):
	reserve = ammo
	Ammo.text = str(amount) + " / " + str(reserve)

func _on_player_coins(coin_amount, high_score):
	coins = coin_amount
	Coins.text = "x" + str(coins)
