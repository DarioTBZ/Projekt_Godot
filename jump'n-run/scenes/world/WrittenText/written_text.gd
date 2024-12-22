extends Area2D

@export var full_text: String = "Dies ist animierter Text, der schrittweise angezeigt wird"
@export var write_speed: float = 0.1
@export var size_font: float = 8

@onready var timer = $Timer
@onready var label = $Label

var current_index: int = 0
var is_player_nearby: bool = false

func _ready() -> void:
	timer.one_shot = true
	var font = label.get_theme_font_size("font_size")
	if font:
		font = size_font
		label.add_theme_font_size_override("font_size", font)
	
	timer.connect("timeout", Callable(_on_timer_timeout))
	timer.wait_time = write_speed # Zeit in Sekunden zwischen Buchstaben


func _on_timer_timeout() -> void:
	current_index += 1
	label.text = full_text.substr(0, current_index)
	if is_player_nearby == true and current_index < full_text.length():
		timer.start()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_player_nearby = true
		timer.start()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_player_nearby = false
