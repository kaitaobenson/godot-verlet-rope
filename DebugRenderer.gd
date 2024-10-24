class_name DebugDrawer
extends Node2D

var points: Array = []
var lines: Array = []

class DebugPoint:
	var pos: Vector2
	var color: Color = Color(1, 1, 1)
	var radius: float = 5.0

class DebugLine:
	var start_pos: Vector2
	var end_pos: Vector2
	var color: Color = Color(1, 1, 1)
	var width: float = 2.0

func add_point(pos: Vector2, color: Color = Color(1, 1, 1), radius: float = 5.0) -> void:
	var point = DebugPoint.new()
	point.pos = pos
	point.color = color
	point.radius = radius
	
	points.append(point)

func add_line(start_pos: Vector2, end_pos: Vector2, color: Color = Color(1, 1, 1), width: float = 2.0):
	var line = DebugLine.new()
	line.start_pos = start_pos
	line.end_pos = end_pos
	line.color = color
	line.width = width
	
	lines.append(line)

func clear_draws() -> void:
	points.clear()
	lines.clear()

func _ready() -> void:
	pass
	#z_index = -100

func _process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	for point in points:
		draw_circle(point.pos, point.radius, point.color)
	for line in lines:
		draw_line(line.start_pos, line.end_pos, line.color, line.width)
	
	clear_draws()
