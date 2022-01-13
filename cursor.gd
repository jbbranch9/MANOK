extends Node2D


onready var mode = "select"

func toggle_mode():
	var next_mode = {
		"select": "slide",
		"slide": "jump",
		"jump": "select",
	}
	mode = next_mode[mode]

func _process(delta):
	position = get_viewport().get_mouse_position()
#	print(mode)
