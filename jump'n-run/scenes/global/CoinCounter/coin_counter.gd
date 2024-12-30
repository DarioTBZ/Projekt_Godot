extends CanvasLayer

@onready var label = $MarginContainer/HBoxContainer/Label
var coint_count: int = 0

func update_coin_count():
	coint_count += 1
	label.text = "%d" % coint_count

func ui_switch_coin_counter():
	if visible == true:
		visible = false
	elif visible == false:
		visible = true
	print("switched coin ui")
