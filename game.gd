extends Node2D

onready var tiles = $board/tiles.get_children()
onready var cursor_focus = null
onready var selection = null


func _process(delta):
	if Input.is_action_just_pressed("select") and cursor_focus != null:
		select(cursor_focus)
		


func _ready():
	connect_signals()


func connect_signals():
	for t in tiles:
		t.connect("cursor_focus", self, "change_cursor_focus")

func change_cursor_focus(new_focus):
	cursor_focus = new_focus

#searches the 'tiles' array and returns the named tile
func get_tile(name):
	var tile = null
	for t in tiles:
		if t.tile_name == name:
			tile = t
	return tile

func highlight():

	var slides = Zones.get_slideables(selection.tile_name)
	var jumps = Zones.get_jumpables(selection.tile_name)
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
		
		#[IF there is already a selection] AND it matches the tile that was just clicked 
		if selection == tile:
			#THEN 'deselect' that tile (set selection to null)
			selection = null
			#and then exit the function
			return

	selection = tile
	selection.flare.visible = true
	
	highlight()
	

