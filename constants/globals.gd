extends Node2D

func _process(_delta):
	
	if Input.is_action_pressed("quit"):
		get_tree().quit()
#	if Input.is_action_just_pressed("toggle_debug_labels"):
#		get_tree().set_group("debug_labels", "visible", "false")
#		pass
