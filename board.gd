extends Node2D

onready var tile_container = $tiles
onready var tiles = $tiles.get_children()

var game

func _ready():
	$background.modulate = Globals.PALETTE["board"]["negative"]

func _input(event):
	if event.is_action_released("toggle_coordinate_visibility"):
		$reference.visible = not $reference.visible 

func get_tile(tile_ID):
	return tile_container.get_node(tile_ID)

func pass_game_reference_to_tiles():
	for t in tiles:
		t.game = game
		t.board = self
