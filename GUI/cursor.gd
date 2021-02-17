extends Node2D

var direction = 1
const speed = .5

func _ready():
	self.modulate = GUI.palette["cursor"]
	#$crosshair.modulate = GUI.palette["cursor"]
	
	

func _process(delta):
	
	self.position = get_global_mouse_position()
	
	$highlight.rotation_degrees += speed*direction
	#$crosshair.rotation_degrees += speed*-direction
	
	#alternate between CW and WS
	if (direction == 1 and $highlight.rotation_degrees > 270) or (direction == -1 and $highlight.rotation_degrees < 0):
		direction *= -1

