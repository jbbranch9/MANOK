extends Node2D

var cursor_focus: hex_tile = null
var selected_tile: hex_tile = null
onready var board = $board
# 2 or 3 players
var number_of_players: int = 3

onready var _A = $players/A
onready var _B = $players/B
onready var _C = $players/C


func _ready():
	set_up_player(_A, 0, Color.red, 5)
	set_up_player(_B, 1, Color.green, 6)
	set_up_player(_C, 2, Color.violet, 7)
	
	
	
	#center the board an pieces
	center_all_in_window([board, _A, _B])
	if number_of_players == 3:
		center_in_window(_C)

func _input(event):
	#if a tile is hovered over, and clicked on:
	if event.is_action_pressed("select") and cursor_focus != null:
		select_tile()

func center_in_window(node):
		node.position = (get_viewport_rect().size / 2) - $board.centerpoint

func center_all_in_window(node_list):
	for node in node_list:
		center_in_window(node)
	pass

func set_up_player(player, index, color, star_pts):
	player.player_index = index
	player.setup_stars(self.board)
	player.set_piece_type(color, star_pts)

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
	

	

