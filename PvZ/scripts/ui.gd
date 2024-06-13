extends CanvasLayer

var timer = 3.0

@onready var reload_timer = $Timer

func _ready():
	pass
	
func _process(delta):
	update_player_health()
	if reload_timer.is_stopped():
			$ReloadBar.hide()
	
	
func update_player_health():
	$HealthBar.value = get_parent().health
	

func _on_shooting_system_shot(ammo_in_magazine):
	$BulletAmount.text = str(ammo_in_magazine)


func _on_shooting_system_gun_reload(ammo_in_magazine, reloading):
	$BulletAmount.text = str(ammo_in_magazine)
	
	if reloading == true:
		reload_timer.start(timer)
		for i in 100:
			$ReloadBar.value = i
			await get_tree().create_timer(0.03).timeout

func _on_shooting_system_mag_size(magazine_size):
	$MaxBullets.text = str(magazine_size)
