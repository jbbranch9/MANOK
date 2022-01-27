extends Area2D

func _ready():
	add_to_group("carriers")




func _on_carrier_area_exited(area):
	if area.is_in_group("pawns"):
		area.show()
