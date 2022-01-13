extends StaticBody2D

signal clicked(tile)

export var tile_name:String


var jumpables 
var slideables 
var zone # outer, inner, or mid

var gamestate

onready var flare = $flare

onready var pawn = $pawn
onready var carrier = $carrier

# all tiles which can be jumped to from this tile
func jumps():
	return Zones.get_jumpables(tile_name)
	
# all tiles which can be slid to from this tile
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

# returns basic data about this tiles current pieces
func has():
	
	var has_pawn = pawn.visible == true
	var pawn_owner
	if has_pawn:
		pawn_owner = gamestate.match_color_to_player(pawn.modulate)
	else:
		pawn_owner = null
	
	var has_carrier = carrier.visible == true
	var carrier_owner
	if has_carrier:
		carrier_owner = gamestate.match_color_to_player(carrier.modulate)
	else:
		carrier_owner = null
	
	var output = {
		'pawn': has_pawn,
		'pawn_owner': pawn_owner,
		'carrier': has_carrier,
		'carrier_owner': carrier_owner,
	}
	
	return output


func place(piece_type, player_color='#FFFFFF'):
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
	piece.visible = false
	piece.modulate = '#FFFFFF'

func _to_string():
	return tile_name


func _on_tile_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("select"):
		emit_signal("clicked", self)
