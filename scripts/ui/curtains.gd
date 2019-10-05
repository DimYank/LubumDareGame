extends TextureRect

signal closed

func _ready():
	hide()
	
func open():
	show()
	var time = .5
	while time > 0:
		modulate = Color(1,1,1,1 *  time / 0.5)
		time -= 0.02
		yield(get_tree().create_timer(0.02), "timeout")
	modulate = Color(1,1,1,0)
	queue_free()

func close():
	show()
	var time = 0.001
	while time < 0.5:
		modulate = Color(1,1,1,1 * time / 0.5)
		time += 0.02
		yield(get_tree().create_timer(0.02), "timeout")
	emit_signal("closed")