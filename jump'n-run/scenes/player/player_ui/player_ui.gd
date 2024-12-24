extends CanvasLayer

@onready var bar = $Control/HPBar

func update_health_bar(new_health: float):
	bar.value = new_health
