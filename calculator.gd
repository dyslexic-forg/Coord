extends PanelContainer

@onready var entry = $VBoxContainer/Entry

signal expression_entered(entry)

func _on_seven_button_pressed():
	entry.text += "7"

func _on_eight_button_pressed():
	entry.text += "8"
	

func _on_nine_button_pressed():
	entry.text += "9"


func _on_clear_button_pressed():
	entry.text = ""


func _on_minus_button_pressed():
	entry.text += "-"


func _on_four_button_pressed():
	entry.text += "4"


func _on_five_button_pressed():
	entry.text += "5"


func _on_six_button_pressed():
	entry.text += "6"


func _on_backspace_button_pressed():
	var s = entry.text
	entry.text = s.left(s.length() - 1)


func _on_times_button_pressed():
	entry.text += "*"


func _on_one_button_pressed():
	entry.text += "1"


func _on_two_button_pressed():
	entry.text += "2"


func _on_three_button_pressed():
	entry.text += "3"


func _on_div_button_pressed():
	entry.text += "/"


func _on_parens_left_button_pressed():
	entry.text += "("


func _on_coma_button_pressed():
	entry.text += ","


func _on_parens_right_button_pressed():
	entry.text += ")"


func _on_equal_button_pressed():
	emit_signal("expression_entered", entry)


func _on_plus_button_pressed():
	entry.text += "+"


func _on_zero_button_pressed():
	entry.text += "0"
