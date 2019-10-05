extends Node

#process-relate
var new_game = false
var cut_scene_name = ""
var after_cut_scene = ""

#player-related
var orders = []
var accepted_orders = []

signal accepted
signal added

func _ready():
	#var order = load("res://scripts/classes/order.gd").new()
	#order.set_values("Омская, 108", "120");
	#put_order(order)
	#accept_order(order)
	pass
	
func put_order(order):
	orders.append(order)
	emit_signal("added")

func accept_order(order):
	if orders.has(order):
		orders.erase(order)
		accepted_orders.append(order)
		emit_signal("accepted")