extends CanvasLayer

@onready var label = $MarginContainer/HBoxContainer/Label
var coint_count: int = 0

func update_coin_count():
	coint_count += 1
	label.text = "%d" % coint_count
