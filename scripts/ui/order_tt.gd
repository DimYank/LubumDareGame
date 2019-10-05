extends TextureRect

onready var address_label = $from
onready var price_label = $price
onready var accept_but = $accept_but

var order

func set_tt(order):
	self.order = order
	address_label.text = "Адрес: " + order.address
	price_label.text = "Цена: " + String(order.price) + " p"
	accept_but.connect("button_down", self, "accept_order")

func accept_order():
	game_state.accept_order(order)
	get_parent().hide_point()