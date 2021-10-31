extends Node2D

onready var tiles = $tiles

func _ready():
	$background.modulate = Globals.PALETTE["board"]["negative"]


func get_tile(tile_ID):
	return tiles.get_node(tile_ID)
