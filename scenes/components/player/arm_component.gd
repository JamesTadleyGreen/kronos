class_name ArmComponent
extends Node


@export_subgroup("Settings")

func handle_arm_movement(body: Line2D) -> void:
	var screen_mouse_position = get_viewport().get_mouse_position()
	var mouse_position = (get_viewport().get_screen_transform() * get_viewport().get_canvas_transform()).affine_inverse() * screen_mouse_position 
	body.look_at(mouse_position)
