extends Node

onready var points = $bg

func _ready():
	var curtains = load("res://scenes/misc/curtains.tscn").instance()
	add_child(curtains)
	curtains.open()
	check_points()

func close_curtains():
	var curtains = load("res://scenes/misc/curtains.tscn").instance()
	add_child(curtains)
	curtains.close()
	return curtains

func check_points():
	for point in points.get_children():
		for order in  game_state.accepted_orders:
			if point.order_address == order.address:
				point.hide()
				print("hidden")