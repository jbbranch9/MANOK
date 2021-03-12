extends Control

#screen for selecting player color and star shape

const palette: Dictionary = GUI.palette

onready var star_color: Color = palette["C"]
onready var sample_stars = $sample_stars.get_children()

func recolor_sample_stars(color: Color):
	for star in sample_stars:
		star.set_color(color)
		
func reshape_sample_stars(num_of_pts: int):
	for star in sample_stars:
		star.set_shape(num_of_pts)

func _ready():
	$background.color = palette["outer"]
	
	# center sample_stars in display frames
	$sample_stars/A.position = $display_port/A.position
	$sample_stars/B.position = $display_port/B.position
	$sample_stars/C.position = $display_port/C.position
	#reshape and recolor sample_stars
	for star in sample_stars:
		var scalar = 1.5
		star.scale = scalar * Vector2(1,1)
	recolor_sample_stars(star_color)
	reshape_sample_stars(5)

#	#makes name entry field auto grab mouse focus so it doesn't need to be clicked on
#	$name_entry.grab_focus()
	
	#set up star shape toggles
	var points = 5
	for toggle in $shape_toggles.get_children():
		toggle.star.set_shape(points)
		toggle.points = points
		points += 1

func _on_ColorPicker_color_changed(color):
	star_color = $custom_ColorPicker.color
	recolor_sample_stars(star_color)


