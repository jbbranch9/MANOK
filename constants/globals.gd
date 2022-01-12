extends Node2D

const PALETTE = {\

"board":{\
	# zones
	"outer":Color("BF9A54"), \
	"mid":Color("e3dfd1"), \
	"inner":Color("6793c2"), \
	
	# blocking line 
	"block":Color("872d23"), \
	
	# negative space 
	"negative":Color("40241A"), \
	
	# carrier stage
	"stage": Color.gray, \
	},

# these colors are just for debug purposes, 
# not necesarily the actual tile highlight colors
"tiles":{\
	"cursor":Color.skyblue, \
	"hover":Color.skyblue, \
	"selected":Color.skyblue, \
	"jumpable":Color.magenta, \
	"slideable":Color.lime, \
	},

# 5 highly colorblind-safe colors
"player_colors":{\
	# cyan
	"A":Color("53EDEB"), \
	# pink
	"B":Color("E6429B"), \
	# orange
	"C":Color("F28A35"), \
	# blue
	"D":Color("714EED"), \
	# yellow
	"E":Color("BDD64D"), \
	},

}


func _process(_delta):
	# universal quit handler
	if Input.is_action_pressed("quit"):
		get_tree().quit()
