extends Node2D

var player_name: String = "Player-1"
# [0,2]
var player_index: int
var piece_shape: int
var player_color: Color


onready var carriers = $carriers.get_children()
onready var stars = $stars.get_children()

onready var game = get_parent().get_parent()


func set_piece_type(player_color: Color, piece_shape: int):
	self.player_color = player_color
	self.piece_shape = piece_shape
	
	for star in stars:
		star.set_shape(piece_shape)
		star.set_color(player_color)
		
	for carrier in carriers:
		carrier.set_color(player_color)


func _ready():
	pass
		
	


func setup_stars(board):
	var configuration:Array
	if game.number_of_players == 2:
		configuration = Zones.CONFIGURATIONS["_2_PLAYER"][player_index]
	elif game.number_of_players == 3:
		configuration = Zones.CONFIGURATIONS["_3_PLAYER"][player_index]
		

	var tile_positions = board.get_tile_positions()
	print(tile_positions)
		
	
	for i in configuration.size():
		var tile = configuration[i]
		var star = self.stars[i]
		#print(tile, star, i)
		star.position = tile_positions[tile]
