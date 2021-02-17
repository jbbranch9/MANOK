extends ColorPicker

const palette: Dictionary = GUI.palette

var SV_field 
var H_field
var color_preview
var eyedropper
var spacer1 
var spacer2
var presets 
var add_preset_button 
var selector
var hsv_toggle
var raw_toggle
var text_box 


#func advanced_options():
#	self.remove_child(presets)
#	selector.get_child(4).add_child(presets)
#
#func presets_only():
#	pass

func _ready():
	#basic settings
	self.edit_alpha = false
	self.presets_enabled = false
	
	#adds colorblindness-safe presets
	self.add_preset(palette["A"])
	self.add_preset(palette["B"])
	self.add_preset(palette["C"])
	self.add_preset(palette["D"])
	self.add_preset(palette["E"])
	
	#identify default ColorPicker components
	SV_field = self.get_child(0).get_child(0)
	H_field = self.get_child(0).get_child(1)	
	color_preview = self.get_child(1).get_child(0)
	eyedropper = self.get_child(1).get_child(1)
	spacer1 = self.get_child(3)
	spacer2 = self.get_child(5)	 
	presets = self.get_child(6)
	add_preset_button = self.get_child(7)	
	selector = self.get_child(4)
	hsv_toggle = selector.get_child(4).get_child(0)
	raw_toggle = selector.get_child(4).get_child(1)
	text_box = selector.get_child(4).get_child(3)

	#toggle visibility for default ColorPicker components
	SV_field.visible = false
	H_field.visible = false
	color_preview.visible = false
	eyedropper.visible = false
	spacer1.visible = false
	spacer2.visible = false
	add_preset_button.visible = false
	hsv_toggle.visible = false
	raw_toggle.visible = false
	presets.visible = true
	selector.visible = true

	
	#move colorblindness-safe presets panel from default to new location inside selector
	self.remove_child(presets)
	selector.get_child(4).add_child(presets)


