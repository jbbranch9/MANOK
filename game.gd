extends Node2D

onready var tiles = $board/tiles.get_children()
onready var cursor_focus = null
onready var selection = null

func _process(delta):
	print($cursor.has_carrier, $cursor.new_carrier)


func _ready():
	connect_signals()
	
	setup_pieces(3)
	
	$carrier_stage.colorize(Globals.PALETTE["player_colors"]["A"])


func setup_pieces(player_count: int):
	var config = Zones.CONFIGURATIONS['_'+str(player_count)+'_PLAYER']
	var p1_color = Globals.PALETTE['player_colors']['A']
	var p2_color = Globals.PALETTE['player_colors']['B']
	var p3_color = Globals.PALETTE['player_colors']['C']
	
	var colors = [p1_color, p2_color]
	if player_count == 3:
		colors.append(p3_color)
	

	for player_config in config:
		var player_ix = config.find(player_config)
		var player_color = colors[player_ix]
		for tile_location in player_config:
			var tile = get_tile(tile_location)
			tile.place('pawn', player_color)

func connect_signals():
	$carrier_stage.connect("carrier_pickup", self, "carrier_pickup")
	for t in tiles:
		t.connect("clicked", self, "tile_clicked")

func carrier_pickup(just_activated):
	if $cursor.has_carrier == false:
		$cursor.toggle_carrier()
	$cursor.new_carrier = just_activated


func tile_clicked(tile):
	if $cursor.has_carrier and not tile.has()["carrier"]:
		tile.place('carrier', Color("#444444"))
		$cursor.toggle_carrier()
		#THEN 'deselect' that tile (set selection to null)
		selection = null
		#and then exit the function
		return
	elif not $cursor.has_carrier and tile.has()["carrier"]:
		carrier_pickup(false)
		tile.remove("carrier")
		select(tile)
	else:
		select(tile)

#searches the 'tiles' array and returns the named tile
func get_tile(tile_ID):
	return $board.get_tile(tile_ID)

func highlight():

	var slides = Zones.get_slideables(selection.tile_name)
	var jumps = Zones.get_jumpables(selection.tile_name)
	
	print(selection)
	print(slides)
	print(jumps)
	print(selection.has())
	
	
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


func select(tile):

	#IF there is already a selection
	if selection != null:

		#unhighlight ALL tiles
		unhighlight()
		
		#IF there is already a selection AND it matches the tile that was just clicked 
		if selection == tile:
			#THEN 'deselect' that tile (set selection to null)
			selection = null
			#and then exit the function
			return
		#IF there is already a selection AND it DOES NOT match the tile that was just clicked 
		else:
			var slides = Zones.get_slideables(selection.tile_name)
			var jumps = Zones.get_jumpables(selection.tile_name)


	selection = tile
	selection.flare.visible = true
	
	highlight()
	

	

