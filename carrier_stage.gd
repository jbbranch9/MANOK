extends Node2D

signal carrier_pickup(just_activated)

onready var carrier_count = 3

#func colorize(color: Color):
#	for s in sprites:
#		s.self_modulate = color

func _on_Button_pressed():
	if carrier_count > 0:
		carrier_count -= 1
		emit_signal("carrier_pickup", true)
#		sprites[carrier_count].visible = false
#		if carrier_count == 2:
#			btn.rect_size = Vector2(128, 64)
#		elif carrier_count == 1:
#			btn.rect_size = Vector2(64, 64)
#		elif carrier_count == 0:
#			btn.disabled = true
			
