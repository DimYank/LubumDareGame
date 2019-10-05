extends Node

func _ready():
	var curtains = load("res://scenes/misc/curtains.tscn").instance()
	add_child(curtains)
	curtains.open()
	$bg/car/AnimationPlayer.play("wheelAnim")
