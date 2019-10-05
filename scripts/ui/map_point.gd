extends TextureButton

export(String) var order_address
export(int) var order_price
const order_sc = preload("res://scenes/ui/order.tscn")

var order_inst

func _ready():
	connect("mouse_entered", self, "show_order")
	connect("mouse_exited", self, "hide_order")
	inst_order()
	
func inst_order():
	var order = load("res://scripts/classes/order.gd").new()
	order.set_values(order_address, order_price)
	order_inst = order_sc.instance()
	order_inst.rect_position = Vector2(50, -order_inst.rect_size.y + 40)
	add_child(order_inst)
	order_inst.set_tt(order)
	hide_order()
	
func show_order():
	order_inst.show()
	
func hide_order():
	order_inst.hide()

func hide_point():
	get_tree().current_scene.close_curtains().connect("closed", self, "to_taxi")
	hide()

func to_taxi():
	get_tree().change_scene("res://scenes/taxi.tscn")