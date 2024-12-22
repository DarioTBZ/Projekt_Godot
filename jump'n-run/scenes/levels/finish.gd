extends Node

@onready var label = $Danke

func _on_area_2d_body_entered(body: Node2D) -> void:
	label.visible = true
