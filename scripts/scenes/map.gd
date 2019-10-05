extends Node

onready var points = $bg
onready var money = $moneyLabel

func _ready():
	var curtains = load("res://scenes/misc/curtains.tscn").instance()
	add_child(curtains)
	curtains.open()
	check_points()
	if game_state.new_game:
		new_game()
	money.text = "Дньги:"+String(game_state.money)+"p"

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

func new_game():
	game_state.new_game = false