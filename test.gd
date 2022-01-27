extends Node2D




onready var c = $carrier
onready var p = $pawn

func _physics_process(delta):
	p.position.x +=1
#	print(c.overlaps_area(p))
