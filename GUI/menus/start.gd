extends Control

const palette: Dictionary = GUI.palette

const targets = {\
"New Game": "res://game_elements/game.tscn", \
"Load Game": "res://game_elements/game.tscn", \
"Settings": "", \
"Credits": "", \
"Quit": "res://GUI/exit.tscn", \
}


func _ready():
	$background.color = palette["outer"]
	$frame/title.set("custom_colors/default_color", palette["block"])
	$frame/title.set("custom_colors/font_color_shadow", palette["negative"])
	$frame/title.set("bbcode_enabled", true)
	$frame/title.set("bbcode_text", "[center]HEXI[/center]")

