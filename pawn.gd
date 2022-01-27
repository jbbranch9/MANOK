extends Area2D

onready var tween = $Tween
var player_color = Color.white

func _ready():
	add_to_group("pawns")




func hide():
	tween.interpolate_property($Sprite, "modulate", null, Color.transparent, .25)
	tween.start()
	
func show():
	tween.interpolate_property($Sprite, "modulate", null, player_color, .10)
	tween.start()

func _on_pawn_area_entered(area):
	if area.is_in_group("carriers"):
		hide()
		

