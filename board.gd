extends Node2D

onready var tiles = $tiles

func _ready():
	$background.modulate = Globals.PALETTE["board"]["negative"]

func _input(event):
	if event.is_action_released("toggle_coordinate_visibility"):
		$reference.visible = not $reference.visible 

func get_tile(tile_ID):
	return tiles.get_node(tile_ID)
