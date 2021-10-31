extends Node2D

signal cursor_focus(tile)

export var tile_name:String


var jumpables #all tiles which can be jumped to from this tile
var slideables #all tiles which can be slid to from this tile
var zone #outer, inner, or mid

onready var flare = $flare

onready var pawn = $pawn
onready var carrier = $carrier


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

func has():
	var has_pawn = pawn.visible == true
	var has_carrier = carrier.visible == true

	#get owner from color
	var owners = {
		Globals.PALETTE['player_colors']['A']: 'P1',
		Globals.PALETTE['player_colors']['B']: 'P2',
		Globals.PALETTE['player_colors']['C']: 'P3',
	}
	
	var pawn_owner
	if has_pawn:
	 pawn_owner = owners[pawn.modulate]
	else:
		pawn_owner = null
	
	var output = {
		'pawn': has_pawn,
		'carrier': has_carrier,
		'pawn_owner': pawn_owner,
	}
	
	return output


func place(piece_type, player_color):
	var pieces = {
		'pawn': pawn,
		'carrier': carrier,
	}
	var piece = pieces[piece_type]
	piece.modulate = player_color
	piece.visible = true

func remove(piece_type):
	var pieces = {
		'pawn': pawn,
		'carrier': carrier,
	}
	var piece = pieces[piece_type]
	piece.modulate = '#FFFFFF'
	piece.visible = false

func _to_string():
	return tile_name
