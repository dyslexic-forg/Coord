extends Node2D

@export var grid: bool = true
@export var axis: bool = true
@export var values: bool = true

var cam
var values_font = SystemFont.new()
@export var unity = 64

func _process(delta):
	queue_redraw()

func _draw():
	var width = get_viewport_rect().size.x
	var height = get_viewport_rect().size.y
	var center = cam.global_position if cam else Vector2(width / 2, height / 2)
	
	if grid:
		for row in range(int((center.y - height / 2) / unity), int((center.y + height / 2) / unity) + 1):
			draw_line(Vector2(center.x - width / 2, row * unity), Vector2(center.x + width / 2, row * unity), Color.WHITE, 1)
		for col in range(int((center.x - width / 2) / unity), int((center.x + width / 2) / unity) + 1):
			draw_line(Vector2(col * unity, center.y - height / 2), Vector2(col * unity, center.y + height / 2), Color.WHITE, 1)
			
	if axis:
		if abs(center.y) < height / 2:
			draw_line(Vector2(center.x - width / 2, 0), Vector2(center.x + width / 2, 0), Color.RED, 2)
		if abs(center.x) < width / 2:
			draw_line(Vector2(0, center.y - height / 2), Vector2(0, center.y + height / 2), Color.GREEN, 2)
			
	if values:
		# x values
		for col in range(int((center.x - width / 2) / unity), int((center.x + width / 2) / unity) + 1):
			draw_string(values_font, Vector2(col * unity, clamp(20, center.y - height / 2 + 20, center.y + height / 2)), str(col))
		# y values
		for row in range(int((center.y - height / 2) / unity), int((center.y + height / 2) / unity) + 1):
			if row != 0:
				draw_string(values_font, Vector2(clamp(20, center.x - width / 2 + 20, center.x + width / 2 - 20), row * unity), str(-row))

func get_local_coords(pos: Vector2) -> Vector2:
	return Vector2(pos.x, -pos.y) / unity
