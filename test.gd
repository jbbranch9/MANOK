extends Node2D

var colors = [GUI.palette["A"], GUI.palette["B"], GUI.palette["C"], GUI.palette["D"], GUI.palette["E"]]
var color_num = 0

func _process(delta):
	if Input.is_action_just_pressed("test"):
		modulate = colors[color_num]
		color_num += 1
		if color_num == 5:
			color_num = 0
