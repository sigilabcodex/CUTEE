extends Node
class_name VehicleController

@export var max_speed: float = 20.0
@export var acceleration: float = 6.0
@export var braking: float = 10.0

var velocity: Vector2 = Vector2.ZERO

func process_input(direction: Vector2, delta: float) -> void:
	if direction.length() > 0.0:
		velocity = velocity.move_toward(direction.normalized() * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, braking * delta)

func get_velocity() -> Vector2:
	return velocity
