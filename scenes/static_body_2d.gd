extends StaticBody2D

@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var polygon_2d: Polygon2D = $CollisionPolygon2D/Polygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#add_child(collision_polygon_2d)
	#collision_polygon_2d.set_polygon(PackedVector2Array([Vector2(40, 40),
 		#Vector2(40, 50),
 		#Vector2(50, 50),
 		#Vector2(50, 40)
		#]))
	
	polygon_2d.polygon = collision_polygon_2d.polygon
	polygon_2d.color = '#000000'

func intersect(poly: Polygon2D):
	var offset_poly = Polygon2D.new()
	offset_poly.global_position = Vector2.ZERO
	var new_values = []
	for point in poly.polygon:
		new_values.append(point + poly.global_position)
	offset_poly.polygon = PackedVector2Array(new_values)
	var intersection = Geometry2D.intersect_polygons($CollisionPolygon2D/Polygon2D.polygon, offset_poly.polygon)
	var clip = Geometry2D.clip_polygons($CollisionPolygon2D/Polygon2D.polygon, offset_poly.polygon)
	if not intersection: return
	var new_poly = Polygon2D.new()
	print(intersection)
	print(clip)
	new_poly.global_position = Vector2.ZERO
	new_poly.set_polygon(intersection)
	print(new_poly)
	new_poly.color='#000000'
	$CollisionPolygon2D/Polygon2D.polygon = intersection[0]
	#return intersection
