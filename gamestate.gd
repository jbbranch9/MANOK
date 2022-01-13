extends Node2D


onready var tiles = $board.tiles
onready var selection = null

var colors

func _ready():
	connect_signals()
	
	setup_pieces(3) #set up a 3-player game
	
	$board.game = self
	$board.pass_game_reference_to_tiles()
		

func match_color_to_player(color:Color):
	var player = null
	if color in colors:
		player = colors.find(color)+1
		
	return player

func setup_pieces(player_count: int):
	var config = Zones.CONFIGURATIONS['_'+str(player_count)+'_PLAYER']
	var p1_color = Globals.PALETTE['player_colors']['A']
	var p2_color = Globals.PALETTE['player_colors']['B']
	var p3_color = Globals.PALETTE['player_colors']['C']
	
	colors = [p1_color, p2_color]
	if player_count == 3:
		colors.append(p3_color)
	

	for player_config in config:
		var player_ix = config.find(player_config)
		var player_color = colors[player_ix]
		for tile_location in player_config:
			var tile = get_tile(tile_location)
			tile.place('pawn', player_color)

func connect_signals():
#	$carrier_stage.connect("carrier_pickup", self, "carrier_pickup")
	for t in tiles:
		t.connect("clicked", self, "tile_clicked")

func carrier_pickup(just_activated):
	if $cursor.has_carrier == false:
		$cursor.toggle_carrier()
	$cursor.new_carrier = just_activated
	if just_activated:
		unhighlight()


func tile_clicked(tile):
	print(tile.has())
	if $cursor.mode == "select":
		if selection == null:
			select(tile)
			$cursor.toggle_mode()
		elif tile in selection.slides() or tile in selection.jumps():
			print(str(selection)+">>"+str(tile))
			deselect()
			$cursor.mode = "select1"
	elif $cursor.mode == "jump":
		deselect()
		$cursor.toggle_mode()
		
		

#searches the 'tiles' array and returns the named tile
func get_tile(tile_ID):
	return $board.get_tile(tile_ID)




func highlight():

	var slides = selection.slides()
	var jumps = selection.jumps()
	
	var all = slides + jumps

	for tile in all:
		#retrieves the object with this tile_name
		tile = get_tile(tile)
		if tile.name in jumps:
			tile.flare.modulate = Globals.PALETTE["tiles"]["jumpable"]
		if tile.name in slides:
			tile.flare.modulate = Globals.PALETTE["tiles"]["slideable"]

		#for each flare component
		for each_flare in tile.flare.get_children():
			#pause the animation on frame '3'
			each_flare.playing = false
			each_flare.frame = 3

		tile.flare.visible = true


func unhighlight():
	for tile in tiles:
		#for each flare component
		for each_flare in tile.flare.get_children():
			#resume animation
			each_flare.playing = true
		tile.colorize()
		tile.flare.visible = false

func deselect():
	unhighlight()
	selection = null

func select(tile):

	if $cursor.mode == "select":
		selection = tile
		selection.flare.visible = true
		
		highlight()
	

	

