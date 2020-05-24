extends TextEdit

const limit = 13
var current_text = ''
var cursor_line = 0
var cursor_coloumn = 0
func _on_TextEdit_text_changed():
	var new_text = text
	if new_text.length() > limit:
		text = current_text
		cursor_set_line(cursor_line)
		cursor_set_column(cursor_coloumn)
	current_text = text
	cursor_line = cursor_get_line()
	cursor_coloumn = cursor_get_column()
	pass # Replace with function body.
