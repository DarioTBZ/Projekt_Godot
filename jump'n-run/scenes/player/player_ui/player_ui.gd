extends CanvasLayer

signal ui_switch_coin_counter

@onready var bar = $MarginContainer/Control/HPBar

func update_health_bar(new_health: float):
	bar.value = new_health

func switch_ui():
	emit_signal("ui_switch_coin_counter")
	if visible == true:
		visible = false
	elif visible == false:
		visible = true
