extends Node2D

class_name hex_tile

const SIDE = 32
const HEIGHT = SIDE * sqrt(3)

const palette: Dictionary = GUI.palette

#is focus of cursor
var is_focus: bool = false
var is_selected: bool = false

var is_slideable_from_selection: bool = false
var is_jumpable_from_selection: bool = false

onready var highlight = $highlight
onready var board = self.get_parent().get_parent()
onready var game =self.get_parent().get_parent().get_parent()


onready var slideable_tiles = Zones.get_slideables(self.name)
onready var jumpable_tiles = Zones.get_jumpables(self.name)

#reference to current game board

func get_polygon():
	return $hex

func _ready():
	#defines points of hex-shaped collision polygon
	var p1 = Vector2(-.5 * SIDE, -.5 * HEIGHT)
	var p2 = Vector2(.5 * SIDE, -.5 * HEIGHT)
	var p3 = Vector2(SIDE, 0)
	var p4 = Vector2(.5 * SIDE, .5 * HEIGHT)
	var p5 = Vector2(-.5 * SIDE, .5 * HEIGHT)
	var p6 = Vector2(-1 * SIDE, 0)
	var poly = $hex/CollisionPolygon2D
	poly.polygon = PoolVector2Array([p1, p2, p3, p4, p5, p6])
	poly.rotation_degrees += 30
	
	
	#invisible until hovered over, or selected
	highlight.visible = false

	$debug_label.text = self.name
	#$debug_label.set("custom_fonts/font", GUI.font_main)
	
	
func highlight_flare(tile: hex_tile):
	tile.highlight.play("flare")
	tile.highlight.modulate = palette["selected"]
	tile.highlight.visible = true

func highlight_as_jumpable(tile: hex_tile):
		tile.highlight.play("solid")
		tile.highlight.modulate = palette["jumpable"]
		tile.highlight.visible = true

func highlight_as_slideable(tile: hex_tile):
		tile.highlight.play("solid")
		tile.highlight.modulate = palette["slideable"]
		tile.highlight.visible = true

func highlight_hover(tile: hex_tile):
		highlight.modulate = palette["hover"]
		highlight.visible = true
		highlight.play("solid")
		
func unhighlight(tile: hex_tile):
	tile.highlight.stop()
	tile.highlight.visible = false
	

func select():
	
	#print("selected: ", self.name)
	
	is_selected = true
	highlight_flare(self)

	for tile_name in jumpable_tiles:
		# reference the tile
		var tile = board.get_tile_by_name(tile_name)
		#turn on animation
		highlight_as_jumpable(tile)
		is_jumpable_from_selection = true

	for tile_name in slideable_tiles:
		var tile = board.get_tile_by_name(tile_name)
		highlight_as_slideable(tile)
		is_slideable_from_selection = true

func deselect():
	
	#print("deselected")
	
	is_selected = false
	highlight.stop()
	highlight.visible = false
	
	for tile_name in jumpable_tiles:
		var tile = board.get_tile_by_name(tile_name)
		unhighlight(tile)
		
		is_slideable_from_selection = false
		is_jumpable_from_selection = false
	



func _on_hover():
	#tell the tile it is in focus
	is_focus = true
	#tell the game WHICH tile is in focus
	game.cursor_focus = self
	
	#if not ALREADY highlighted, highlight with solid border
	if not is_selected:
		highlight_hover(self)

	#print(self.position, ' tile: ', self.name, ' slides to: ', slideable_tiles, ' jumps to: ', jumpable_tiles)
	
	var path = "tiles/" + self.name

	
func _on_hover_exited():

	# turn off highlight after exiting hover, unless tile is/was selected
	if not is_selected:
		unhighlight(self)
	#re-select the selected tile, so the cursor doesn't unhighlight every tile it hovers over
	if game.selected_tile != null:
		game.selected_tile.select()
	
	is_focus = false
	game.cursor_focus = null
