extends Node2D

const PALETTE = {\

"board":{\
	"outer":Color("BF9A54"), \
	"mid":Color("F7F3e3"), \
	"inner":Color("83A1C2"), \
	"block":Color("872d23"), \
	"negative":Color("40241A"), \
	"stage": Color.gray, \
	},

"tiles":{\
	"cursor":Color.skyblue, \
	"hover":Color.skyblue, \
	"selected":Color.skyblue, \
	"jumpable":Color.magenta, \
	"slideable":Color.lime, \
	},

"player_colors":{\
	"A":Color("53EDEB"), \
	"B":Color("E6429B"), \
	"C":Color("F28A35"), \
	"D":Color("714EED"), \
	"E":Color("BDD64D"), \
	},

}




func _process(_delta):
	
	if Input.is_action_pressed("quit"):
		get_tree().quit()
