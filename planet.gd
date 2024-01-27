extends Area2D

var health

signal has_take_damage(damage)
signal die

func _ready():
	reset()
	
func reset():
	health = 300
	$HealthBar.max_value = health
	$HealthBar.value = health
	$AnimatedSprite2D.play("default")

func _die():
	$AnimatedSprite2D.play("destroyed")
	$AudioStreamPlayer2D.play()
			
func take_damage(damage):
	if health > 0:
		health = max(health - damage, 0)
		$HealthBar.set_value(health)
		emit_signal("has_take_damage", damage)
		if health == 0:
			emit_signal("die")

func _on_die():
	_die()
	
