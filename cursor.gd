extends Node2D

onready var has_carrier = false

func toggle_carrier():
	has_carrier = not has_carrier
	if has_carrier:
		$carrier.visible = true
	else:
		$carrier.visible = false

func _process(delta):
	position = get_viewport().get_mouse_position()
