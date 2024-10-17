extends Node

var inventory

func _ready():
	inventory = Inventory
	update_inventory_display()
	
func update_inventory_display():
	for child in $MarginContainer/VBoxContainer.get_children():
		child.queue_free()

	for item_name in inventory.items.keys():
		var label = Label.new()
		label.text = item_name + ": " + str(inventory.items[item_name])
		$MarginContainer/VBoxContainer.add_child(label)
