extends Node2D

const s5 = preload("res://ASSETS/pieces/new_stars/5.png")
const s6 = preload("res://ASSETS/pieces/new_stars/6.png")
const s7 = preload("res://ASSETS/pieces/new_stars/7.png")
const s8 = preload("res://ASSETS/pieces/new_stars/8.png")
const s9 = preload("res://ASSETS/pieces/new_stars/9.png")

func set_shape(num_of_pts: int):
	var shapes = [s5, s6, s7, s8, s9]
	var index = num_of_pts - len(shapes)
	$Sprite.texture = shapes[index]
	
func set_color(color: Color):
	modulate = color

func _ready():
	pass

