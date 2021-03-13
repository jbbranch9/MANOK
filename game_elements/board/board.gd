extends Node2D

onready var outer_tiles = [
		$tiles/D9,\
		$tiles/F9,\
		$tiles/H9,\
		$tiles/J9,\
		$tiles/L9,\
		$tiles/N9,\
		$tiles/O8,\
		$tiles/P7,\
		$tiles/Q6,\
		$tiles/P5,\
		$tiles/O4,\
		$tiles/N3,\
		$tiles/M2,\
		$tiles/L1,\
		$tiles/J1,\
		$tiles/H1,\
		$tiles/F1,\
		$tiles/E2,\
		$tiles/D3,\
		$tiles/C4,\
		$tiles/B5,\
		$tiles/A6,\
		$tiles/B7,\
		$tiles/C8]
onready var mid_tiles = [
		$tiles/G8,\
		$tiles/K8,\
		$tiles/N7,\
		$tiles/N5,\
		$tiles/L3,\
		$tiles/I2,\
		$tiles/F3,\
		$tiles/D5,\
		$tiles/D7,\
		$tiles/F7,\
		$tiles/H7,\
		$tiles/J7,\
		$tiles/L7,\
		$tiles/M6,\
		$tiles/L5,\
		$tiles/K4,\
		$tiles/J3,\
		$tiles/H3,\
		$tiles/G4,\
		$tiles/F5,\
		$tiles/E6]
onready var inner_tiles = [
		$tiles/I6,\
		$tiles/H5,\
		$tiles/J5]
onready var all_tiles = $tiles.get_children()

onready var game = self.get_parent()

var lower_right_bound: Vector2
var centerpoint: Vector2

func _ready():
	center_jump_zones()
	
	#defines the outer extremities and centerpoint of the 'bounding box' around the tiles
	var rightmost = $tiles/Q6
	var bottommost = $tiles/L1
	lower_right_bound = Vector2(rightmost.position.x + rightmost.WIDTH/2, bottommost.position.y + bottommost.WIDTH/2)
	centerpoint = lower_right_bound / 2
	


# returns a dictionary of tiles' Vector2 coordinates, searchable by their names
func get_tile_positions():
	var tile_positions = {}
	for tile in all_tiles:
		tile_positions[tile.name] = tile.position
	return tile_positions

func center_jump_zones():
	center_between($tiles/D9, $tiles/F7, $jump_zones/NNW)
	center_between($tiles/H9, $tiles/J7, $jump_zones/N)
	center_between($tiles/L9, $tiles/N7, $jump_zones/NNE)
	center_between($tiles/B7, $tiles/D5, $jump_zones/W)
	center_between($tiles/F7, $tiles/H5, $jump_zones/NW)
	center_between($tiles/J7, $tiles/L5, $jump_zones/NE)
	center_between($tiles/N7, $tiles/P5, $jump_zones/E)
	center_between($tiles/D5, $tiles/F3, $jump_zones/SW)
	center_between($tiles/H5, $tiles/J3, $jump_zones/S)
	center_between($tiles/L5, $tiles/N3, $jump_zones/SE)
	center_between($tiles/F3, $tiles/H1, $jump_zones/SSW)
	center_between($tiles/J3, $tiles/L1, $jump_zones/SSE)
	
#positions C between A and B
func center_between(A, B, C):
	var pt_A = A.position
	var pt_B = B.position
	var delta = pt_A.distance_to(pt_B)/2
	var dir = pt_A.direction_to(pt_B)
	C.position = pt_A + (delta * dir)


# returns object reference based on name
func get_tile_by_name(tile_name:String):
	return $tiles.get_node(tile_name)


