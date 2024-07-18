extends TileMap

@onready var locked = $Area2D/Locked

var coins_needed = 7

func _ready():
	locked.text = "LOCKED"

func _process(delta):
	if Global.coins >= coins_needed:
		locked.text = "UNLOCKED"

func _use_tile_data_runtime_update(layer, coords):
	if coords in get_used_cells_by_id(1):
		return true
	return false
	
func _tile_data_runtime_update(layer, coords, tile_data):
	tile_data.set_navigation_polygon(0, null)

func _on_area_2d_body_entered(body):
	if body is Player and Global.coins >= coins_needed:
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
