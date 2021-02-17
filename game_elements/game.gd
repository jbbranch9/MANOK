extends Node2D

var cursor_focus: hex_tile = null
var selected_tile: hex_tile = null
onready var board = $board
# 2 or 3 players
var number_of_players: int = 3

func _ready():
	set_up_player()

func _input(event):
	#if a tile is hovered over, and clicked on:
	if event.is_action_pressed("select") and cursor_focus != null:
		select_tile()




func set_up_player():
	$players/A.set_piece_type(Color.magenta, 7)
	$players/A.player_index = 2
	$players/A.setup_stars(self.board)

func select_tile():

	#unhighlight previous selected_tile (including re-clicking same tile)
	if selected_tile != null:
		selected_tile.deselect()
		
	# if reclicking the currently selected tile
	if	selected_tile == cursor_focus:
	# then deselect, set selection to null
		selected_tile.deselect()
		selected_tile = null
	else:
	# else (if clicking a new tile) set selection to the current focus (the tile just clicked on)
		selected_tile = cursor_focus
		cursor_focus.select()
	

	

