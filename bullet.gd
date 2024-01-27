extends Area2D

var direction = Vector2(0, 0) : set = _set_direction
var speed = 700
var damage = 10

func config(position_, direction_):
	position = position_
	direction = direction_

func _process(delta):
	position += direction * speed * delta
	
func _set_direction(direction_):
	direction = direction_
	look_at(direction)

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage)
		queue_free()


func _on_area_entered(area):
	if area.is_in_group("planets"):
		area.take_damage(damage)
		queue_free()
