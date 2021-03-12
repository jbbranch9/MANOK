extends RichTextLabel

const palette: Dictionary = GUI.palette

#is focus of cursor
var is_focus: bool = false

#path to target scene for this label
var target: String

onready var start_menu = get_parent().get_parent().get_parent()
onready var target_list = start_menu.targets

func _ready():
	#set colors
	self.set("custom_colors/default_color", palette["mid"])
	self.set("custom_colors/font_color_shadow", palette["block"])
	#place drop shadow
	self.set("custom_constants/shadow_offset_x", 2)
	self.set("custom_constants/shadow_offset_y", 2)
	#set and format text
	self.set("bbcode_enabled", true)
	var label_text = "[center]"+self.name+"[/center]"
	self.set("bbcode_text", label_text)
	#set target
	#target = get_parent().targets[name]

func _process(delta):
	#if hovered over, and clicked on
	if is_focus and Input.is_action_just_pressed("select"):
		#change scene to target
		get_tree().change_scene(target_list[name])
		
	

func _on_hover():
	#move drop shadow out
	set("custom_constants/shadow_offset_x", 7)
	set("custom_constants/shadow_offset_y", 7)
	
	is_focus = true

	#print(start_menu.targets[name])
	

func _on_hover_exited():
	#move drop shadow back in
	set("custom_constants/shadow_offset_x", 2)
	set("custom_constants/shadow_offset_y", 2)

	is_focus = false
