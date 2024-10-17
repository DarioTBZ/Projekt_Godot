extends Area2D

var item_name: String = "Potion"



func _on_body_entered(body):
	if body.is_in_group("player"):
		Inventory.add_item(item_name)
		body.get_node("inventory").update_inventory_display()
		queue_free()
