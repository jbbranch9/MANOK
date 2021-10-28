extends Node2D

#jump zones
const NNW = ['D9', 'F9', 'G8', 'F7', 'D7', 'C8']
const N = ['H9', 'J9', 'K8', 'J7', 'H7', 'G8']
const NNE = ['L9', 'N9', 'O8', 'N7', 'L7', 'K8']
const W = ['B7', 'D7', 'E6', 'D5', 'B5', 'A6']
const NW = ['F7', 'H7', 'I6', 'H5', 'F5', 'E6']
const NE = ['J7', 'L7', 'M6', 'L5', 'J5', 'I6']
const E = ['N7', 'P7', 'Q6', 'P5', 'N5', 'M6']
const SW = ['D5', 'F5', 'G4', 'F3', 'D3', 'C4']
const S = ['H5', 'J5', 'K4', 'J3', 'H3', 'G4']
const SE = ['L5', 'N5', 'O4', 'N3', 'L3', 'K4']
const SSW = ['F3', 'H3', 'I2', 'H1', 'F1', 'E2']
const SSE = ['J3', 'L3', 'M2', 'L1', 'J1', 'I2']

#slideables
const D9 = ['F9', 'C8']
const F9 = ['H9', 'G8', 'D9']
const H9 = ['G8', 'F9']
const J9 = ['L9', 'K8']
const L9 = ['N9', 'K8', 'J9']
const N9 = ['O8', 'L9']
const C8 = ['D9', 'D7', 'B7']
const G8 = ['F9', 'H9', 'H7', 'F7']
const K8 = ['J9', 'L9', 'L7', 'J7']
const O8 = ['N9', 'P7', 'N7']
const B7 = ['C8', 'D7', 'A6']
const D7 = ['C8', 'F7', 'E6', 'B7']
const F7 = ['G8', 'H7', 'E6', 'D7']
const H7 = ['G8', 'J7', 'I6', 'F7']
const J7 = ['K8', 'L7', 'I6', 'H7']
const L7 = ['K8', 'N7', 'M6', 'J7']
const N7 = ['O8', 'P7', 'M6', 'L7']
const P7 = ['O8', 'Q6', 'N7']
const A6 = ['B7', 'B5']
const E6 = ['D7', 'F7', 'F5', 'D5']
const I6 = ['H7', 'J7']
const M6 = ['L7', 'N7', 'N5', 'L5']
const Q6 = ['P7', 'P5']
const B5 = ['A6', 'D5', 'C4']
const D5 = ['E6', 'F5', 'C4', 'B5']
const F5 = ['E6', 'H5', 'G4', 'D5']
const H5 = ['G4', 'F5']
const J5 = ['L5', 'K4']
const L5 = ['M6', 'N5', 'K4', 'J5']
const N5 = ['M6', 'P5', 'O4', 'L5']
const P5 = ['Q6', 'O4', 'N5']
const C4 = ['B5', 'D5']
const G4 = ['F5', 'H5', 'H3', 'F3']
const K4 = ['J5', 'L5', 'L3', 'J3']
const O4 = ['N5', 'P5']
const D3 = ['F3', 'E2']
const F3 = ['G4', 'H3', 'E2', 'D3']
const H3 = ['G4', 'J3', 'I2', 'F3']
const J3 = ['K4', 'L3', 'I2', 'H3']
const L3 = ['K4', 'N3', 'M2', 'J3']
const N3 = ['M2', 'L3']
const E2 = ['D3', 'F3', 'F1']
const I2 = ['H3', 'J3', 'J1', 'H1']
const M2 = ['L3', 'N3', 'L1']
const F1 = ['E2', 'H1']
const H1 = ['I2', 'J1', 'F1']
const J1 = ['I2', 'L1', 'H1']
const L1 = ['M2', 'J1']

const JUMP_ZONES = [NNW, N, NNE, W, NW, NE, E, SW, S, SE, SSW, SSE]

const SLIDEABLES = [D9, F9, H9, J9, L9, N9, \
C8, G8, K8, O8, \
B7, D7, F7, H7, J7, L7, N7, P7, \
A6, E6, I6, M6, Q6, \
B5, D5, F5, H5, J5, L5, N5, P5, \
C4, G4, K4, O4, \
D3, F3, H3, J3, L3, N3, \
E2, I2, M2, \
F1, H1, J1, L1]

const TILES = ['D9', 'F9', 'H9', 'J9', 'L9', 'N9', \
'C8', 'G8', 'K8', 'O8', \
'B7', 'D7', 'F7', 'H7', 'J7', 'L7', 'N7', 'P7', \
'A6', 'E6', 'I6', 'M6', 'Q6', \
'B5', 'D5', 'F5', 'H5', 'J5', 'L5', 'N5', 'P5', \
'C4', 'G4', 'K4', 'O4', \
'D3', 'F3', 'H3', 'J3', 'L3', 'N3', \
'E2', 'I2', 'M2', \
'F1', 'H1', 'J1', 'L1']

const OUTER = ['D9', 'F9', 'H9', 'J9', 'L9', 'N9', 'O8', 'P7', 'Q6', 'P5', 'O4', 'N3', 'M2', 'L1', 'J1', 'H1', 'F1', 'E2', 'D3', 'C4', 'B5', 'A6', 'B7', 'C8']
const MID = ['G8', 'K8', 'N7', 'N5', 'L3', 'I2', 'F3', 'D5', 'D7', 'F7', 'H7', 'J7', 'L7', 'M6', 'L5', 'K4', 'J3', 'H3', 'G4', 'F5', 'E6']
const INNER = ['I6', 'J5', 'H5']

# init star placements for 2-player
const PLAYER_A_of_2 = ['D9', 'H9', 'L9', 'O8', 'Q6', 'O4', 'M2', 'J1', 'F1', 'D3', 'B5', 'B7']
const PLAYER_B_of_2 = ['F9', 'J9', 'N9', 'P7', 'P5', 'N3', 'L1', 'H1', 'E2', 'C4', 'A6', 'C8']

# init star placements for 3-player
const PLAYER_A_of_3 = ['D9', 'J9', 'O8', 'P5', 'M2', 'H1', 'D3', 'A6']
const PLAYER_B_of_3 = ['C8', 'H9', 'N9', 'Q6', 'N3', 'J1', 'E2', 'B5']
const PLAYER_C_of_3 = ['B7', 'F9', 'L9', 'P7', 'O4', 'L1', 'F1', 'C4']

const CONFIGURATIONS  = {
	"_2_PLAYER": [PLAYER_A_of_2, PLAYER_B_of_2],
	"_3_PLAYER": [PLAYER_A_of_3, PLAYER_B_of_3, PLAYER_C_of_3],
}

#returns list of tiles accessible by sliding from "tile_name"
#these were just hard-coded because it was easier, and I know due to playtesting that they're very unlikely to change
func get_slideables(tile_name:String):
	var index = TILES.find(tile_name)
	return SLIDEABLES[index]
	
#returns list of tiles accessible by jumping from "tile_name"
#contains duplicates, because you can jump anywhere that you can slide,
#these duplicates will effectively be ignored by the code
func get_jumpables(tile_name:String):

	var jumpables = []
	for zone in JUMP_ZONES:
		# if this tile is in this jump zone
		if tile_name in zone:
			# add all of the tiles in that zone to the jumpable tiles set
			jumpables += zone
	# you can jump anywhere you can also slide
	jumpables += get_slideables(tile_name)
	# this removes this "tile_name" from "jumpables"
	# because you ALWAYS must jump to a DIFFERENT tile
	while tile_name in jumpables:
		var index = jumpables.find(tile_name)
		jumpables.remove(index)
	return jumpables
	
func get_zone(tile_name:String):
	var zone
	if tile_name in OUTER:
		zone = "outer"
	elif tile_name in MID:
		zone = "mid"
	elif tile_name in INNER:
		zone = "inner"
	return zone
