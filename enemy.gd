extends CharacterBody2D

signal fire(position, direction)

func _on_fire_timer_timeout():
	emit_signal("fire", position, Vector2(cos(rotation), sin(rotation)))
	$AudioStreamPlayer2D.play()

