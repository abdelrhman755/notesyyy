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
	line.text_submitted.connect(add_note) # sending note to the line edit after pressing enter
	
	# making the add note botton
	button = Button.new()
	button.text = "Add Note"
	button.pressed.connect(add_note)
	vbox.add_child(button)
	
	# making a separating line
	var separator = HSeparator.new()
	var sep_style = StyleBoxLine.new()
	sep_style.color = Color.WHITE
	sep_style.thickness = 1
	separator.add_theme_stylebox_override("separator", sep_style)
	vbox.add_child(separator)
	
	#container of the added notes
	container = VBoxContainer.new()
	vbox.add_child(container)
	
	add_control_to_dock(DOCK_SLOT_LEFT_UL, ui)

func _exit_tree():
	remove_control_from_docks(ui)
	if is_instance_valid(ui):
		ui.queue_free()

# function to add a note
func add_note(text_from_line_edit: String =""):
	var note_text = line.text.strip_edges()
	if note_text == "":
		return
	var new_note = Label.new()
	new_note.text = "• " + note_text
	container.add_child(new_note)
	line.clear()
