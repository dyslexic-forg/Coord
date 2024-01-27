extends CharacterBody2D

const MAXSPEED = 400
const ASPEED = 5
const accelaration = 3

var direction = Vector2(0, -1)

func _physics_process(delta):
	direction = direction.rotated(Input.get_axis("left", "right") * ASPEED * delta)
	if Input.is_action_pressed("forward"):
		velocity += accelaration * direction
		velocity = velocity.limit_length(MAXSPEED)
		$Sprite2D/Propulsion.visible = true
	else:
		$Sprite2D/Propulsion.visible = false
	move_and_slide()
	
	$Sprite2D.rotation = direction.angle() + PI / 2
