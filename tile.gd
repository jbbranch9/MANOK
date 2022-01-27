extends StaticBody2D

signal clicked(tile)

export var tile_name:String


var jumpables 
var slideables 
var zone #outer, inner, or mid

var board
var game

onready var flare = $flare


#all tiles which can be jumped to from this tile
func jumps():
	return Zones.get_jumpables(tile_name)
	
#all tiles which can be slid to from this tile
func slides():
	return Zones.get_slideables(tile_name)
	
func zone():
	return Zones.get_zone(tile_name)

func _ready():
	colorize()


#color according to zone
func colorize():
	var tile_color = Globals.PALETTE["board"][zone()]
	$Sprite.modulate = tile_color
	$flare.modulate = tile_color


#func has():
#	var has_pawn = pawn.visible == true
#	var has_carrier = carrier.visible == true
#
#
#	var pawn_owner
#	if has_pawn:
#		pawn_owner = game.match_color_to_player(pawn.modulate)
#
#	var carrier_owner
#	if has_carrier:
#		carrier_owner = game.match_color_to_player(carrier.modulate)
#
#
#
#	var output = {
#		'pawn': has_pawn,
#		'carrier': has_carrier,
#		'pawn_owner': pawn_owner,
#		'carrier_owner': carrier_owner,
#	}
#
#	return output
#
#
#func place(piece_type, player_color='#FFFFFF'):
#	var pieces = {
#		'pawn': pawn,
#		'carrier': carrier,
#	}
#	var piece = pieces[piece_type]
#	piece.modulate = player_color
#	piece.visible = true
#
#func remove(piece_type):
#	var pieces = {
#		'pawn': pawn,
#		'carrier': carrier,
#	}
#	var piece = pieces[piece_type]
#	piece.visible = false
#	piece.modulate = '#FFFFFF'

func _to_string():
	return tile_name


func _on_tile_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("select"):
		emit_signal("clicked", self)
