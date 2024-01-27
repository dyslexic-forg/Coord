extends Control

signal new_game

func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("new_game")
