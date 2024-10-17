extends Node

var items: Dictionary = {}

func add_item(item_name: String, amount: int = 1):
	if item_name in items:
		items[item_name] += amount
	else:
		items[item_name] = amount
		
func remove_item(item_name: String, amount: int = 1):
	if item_name in items:
		items[item_name] -= amount
		if items[item_name] <= 0:
			items.erase(item_name)

func has_item(item_name: String) -> bool:
	return item_name in items
