extends Node2D

var Bullet = preload("res://bullet.tscn")

var score = 0
var _game_over = false

func _ready():
	$CartesianPlane.cam = $Camera2D
	random_pos($Enemy)

func _on_calculator_expression_entered(entry):
	if not _game_over:
		var pos = parse_expression(entry.text)
		if pos:
			$Laser.shoot(pos.reflect(Vector2(1, 0)) * $CartesianPlane.unity)
			if pos == $CartesianPlane.get_local_coords($Enemy.position):
				random_pos($Enemy)
				update_score(score+1)
			else:
				print("meh")
			entry.text = ""

func update_score(new_score):
	score = new_score
	$Score.text = "Score: %d" % score

func _process(_delta):
	if Input.is_action_just_released("toggle_gui"):
		$Calculator.visible = not $Calculator.visible

func random_pos(obj):
	obj.position = Vector2(
		randi_range(-14, 14) * $CartesianPlane.unity,
		randi_range(-8, 8) * $CartesianPlane.unity
	)
	obj.rotation = ($Planet.position - obj.position).angle()

func parse_expression(str):
	if str.length() > 1 and str[0] == "(" and str[str.length()-1] == ")":
		var slices = str.substr(1, str.length()-2).split(",")
		if slices.size() == 2 and slices[0].is_valid_int() and slices[1].is_valid_int():
			return Vector2(int(slices[0]), int(slices[1]))


func _on_enemy_fire(position, direction):
	if not _game_over:
		var bullet = Bullet.instantiate()
		bullet.config(position, direction)
		$Bullets.add_child(bullet)


func _on_planet_has_take_damage(damage):
	if not _game_over:
		$Camera2D.add_trauma(0.2)


func _on_planet_die():
	$Camera2D.add_trauma(1)
	_game_over = true
	$Enemy/FireTimer.stop()
	$GameOverScreen.visible = true

func _on_game_over_screen_new_game():
	_game_over = false
	update_score(0)
	$GameOverScreen.visible = false
	$Planet.reset()
	$Enemy/FireTimer.start()
	$GameOverScreen.visible = false
	random_pos($Enemy)
