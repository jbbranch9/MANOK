extends Node2D

signal carrier_pickup(just_activated)

onready var carrier_count = 3

#func colorize(color: Color):
#	for s in sprites:
#		s.self_modulate = color

func _on_Button_pressed():
	if carrier_count > 0:
		carrier_count -= 1
