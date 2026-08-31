@tool
extends EditorPlugin

var ui : Control
var container: VBoxContainer
var button: Button
var line: LineEdit

func _enter_tree():
	#making the dock 
	ui = Control.new()
	ui.name = "Notesyyy"
	ui.custom_minimum_size = Vector2(250 , 400)
	
	# the container of all the elements in the dock
	var vbox = VBoxContainer.new()
	vbox.set_anchors_preset(Control.PRESET_FULL_RECT)
	ui.add_child(vbox)
	
	
	# title of the dock
	var title = Label.new()
	title.text = " Welcome To Notesyyy"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(title)
	
	# subtitile
	var subt = Label.new()
	subt.text = "Let's manage your project..\n"
	subt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(subt) 
	
	# the input box 
	line = LineEdit.new()
	line.placeholder_text = "Write a Note..."
	vbox.add_child(line)
	line.text_submitted.connect(add_note)
	
	add_control_to_dock(DOCK_SLOT_LEFT_UL, ui)

func _exit_tree():
	remove_control_from_docks(ui)
	ui.free()

func add_note():
	pass
