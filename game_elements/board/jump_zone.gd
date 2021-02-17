extends Node2D


func _ready():
	$debug_label.text = self.name
	#$debug_label.set("custom_fonts/font", GUI.font_main)
