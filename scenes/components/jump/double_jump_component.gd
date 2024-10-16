class_name DoubleJumpComponent
extends Node


@export_subgroup("Settings")
#@export var double_jump_effect: DoubleJumpEffectComponent
@export var jump_velocity: float = -350.0

var can_double_jump: bool = false

func reset_jump(body: CharacterBody2D):
	if body.is_on_floor():
		can_double_jump = true

func handle_double_jump(body: CharacterBody2D, want_to_jump: bool, is_falling: bool) -> void:
	if want_to_jump and is_falling and can_double_jump:
		body.velocity.y = jump_velocity
		can_double_jump = false
