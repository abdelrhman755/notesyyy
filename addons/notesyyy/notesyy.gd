@tool
extends EditorPlugin

var ui : Control
func _enter_tree():
	ui = Control.new()
	ui.name = "Notesyyy"
	add_control_to_dock(DOCK_SLOT_LEFT_UL, ui)
	ui.custom_minimum_size = Vector2(250 , 400)



func _exit_tree():
	remove_control_from_docks(ui)
	ui.free()
