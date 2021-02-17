extends Node2D

const palette: Dictionary = GUI.palette


func _ready():
	$outer.modulate = palette["outer"]
	$mid.modulate = palette["mid"]
	$inner.modulate = palette["inner"]
	$blocks.modulate = palette["block"]
	$blocks_negative.modulate = palette["negative"]
	$background.modulate = palette["negative"]
