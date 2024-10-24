class_name Util

static func get_closest_point_on_shape(pos: Vector2, shape: Shape2D, shape_transform: Transform2D) -> Vector2:
	if shape is WorldBoundaryShape2D:
		return get_closest_point_on_world_boundary(pos, shape, shape_transform)
	elif shape is SegmentShape2D:
		return get_closest_point_on_segment(pos, shape, shape_transform)
	elif shape is SeparationRayShape2D:
		return get_closest_point_on_separation_ray(pos, shape, shape_transform)
	elif shape is CircleShape2D:
		return get_closest_point_on_circle(pos, shape, shape_transform)
	elif shape is RectangleShape2D:
		return get_closest_point_on_rectangle(pos, shape, shape_transform)
	elif shape is CapsuleShape2D:
		pass
		#return get_closest_point_on_capsule(pos, shape, shape_transform)
	elif shape is ConvexPolygonShape2D:
		pass
		#return get_closest_point_on_convex_polygon(pos, shape, shape_transform)
	elif shape is ConcavePolygonShape2D:
		pass
		return get_closest_point_on_concave_polygon(pos, shape, shape_transform)
	
	return Vector2(0, 0)

static func get_closest_point_on_world_boundary(pos: Vector2, shape: WorldBoundaryShape2D, shape_transform: Transform2D) -> Vector2:
	var shape_pos = shape_transform.origin
	var point_to_line_distance = shape.normal.dot(pos - shape_pos) - shape.distance
	return pos - shape.normal * point_to_line_distance

static func get_closest_point_on_segment(pos: Vector2, shape: SegmentShape2D, shape_transform: Transform2D) -> Vector2:
	var a: Vector2 = shape.a * shape_transform.get_scale() + shape_transform.origin
	var b: Vector2 = shape.b * shape_transform.get_scale() + shape_transform.origin
	return Geometry2D.get_closest_point_to_segment(pos, a, b)

static func get_closest_point_on_separation_ray(pos: Vector2, shape: SeparationRayShape2D, shape_transform: Transform2D) -> Vector2:
	return Vector2(0, 0)  # Not really sure what separation ray is

static func get_closest_point_on_circle(pos: Vector2, shape: CircleShape2D, shape_transform: Transform2D) -> Vector2:
	var shape_pos = shape_transform.origin
	var direction: Vector2 = (pos - shape_pos).normalized()
	return shape_pos + direction * shape.radius

static func get_closest_point_on_rectangle(pos: Vector2, shape: RectangleShape2D, shape_transform: Transform2D) -> Vector2:
	var half_size: Vector2 = shape.size * 0.5
	var points: PackedVector2Array = [
		
	]
	return Vector2(0, 0)
	"""
	# Clamp the position to the rectangle's bounds
	return Vector2(
		clamp(pos.x, rect_min.x, rect_max.x),
		clamp(pos.y, rect_min.y, rect_max.y)
	)
	"""

static func get_closest_point_on_concave_polygon(pos: Vector2, shape: ConcavePolygonShape2D, shape_transform: Transform2D) -> Vector2:
	var closest_point: Vector2
	var dist: float = INF
	
	for i in range(shape.segments.size()):
		var current_closest_point = Geometry2D.get_closest_point_to_segment(pos, shape.segments[i - 1], shape.segments[i])
		var current_dist = current_closest_point.distance_to(pos)
		
		if current_dist < dist:
			closest_point = current_closest_point
			dist = current_dist
	
	return closest_point
