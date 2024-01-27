extends RayCast2D

func _ready():
	visible = false

func set_target(target: Vector2) -> void:
	target_position = target
	$Line2D.points[1] = target

func appear_then_disappear() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Line2D, "width", 10, 0.2)
	tween.tween_property($Line2D, "width", 0, 0.2)
	
func shoot(target: Vector2) -> void:
	visible = true
	set_target(target)
	appear_then_disappear()
	$AudioStreamPlayer2D.play()
