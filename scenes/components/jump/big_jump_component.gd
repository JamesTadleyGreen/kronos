class_name JumpComponent
extends Node


@export_subgroup("Settings")
@export var jump_velocity: float = -350.0

var is_jumping: bool = false


func handle_jump(body: CharacterBody2D, want_to_jump: bool) -> void:
	if want_to_jump and body.is_on_floor():
		body.velocity.y = jump_velocity
		var collision = body.get_slide_collision(0)
		if not collision: return
		#collision.get_collider().intersect($Polygon2D)

	is_jumping = body.velocity.y < 0 and not body.is_on_floor()
