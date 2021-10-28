extends Node2D

signal cursor_focus(tile)

export var tile_name:String


var jumpables #all tiles which can be jumped to from this tile
var slideables #all tiles which can be slid to from this tile
var zone #outer, inner, or mid

onready var flare = $flare




func _ready():

	jumpables = Zones.get_jumpables(tile_name)
	slideables = Zones.get_slideables(tile_name)
	zone = Zones.get_zone(tile_name)
	
	colorize()


#color according to zone
func colorize():
	var tile_color = Globals.PALETTE["board"][zone]
	$Sprite.modulate = tile_color
	$flare.modulate = tile_color
	

func _on_mouse_over():
	emit_signal("cursor_focus", self)

