extends CanvasLayer

@onready var bar = $HPBar

func update_health_bar(new_health: float):
	bar.value = new_health
