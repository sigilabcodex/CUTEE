extends Node
class_name VehicleController

@export var max_speed: float = 20.0
@export var acceleration: float = 6.0
@export var braking: float = 10.0

var velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	apply_tuning(_get_default_tuning())
	_load_tuning_from_json(_get_tuning_config_path())

func process_input(direction: Vector2, delta: float) -> void:
	update_movement(direction, delta)

func update_movement(direction: Vector2, delta: float) -> void:
	# Default lightweight arcade movement model.
	if direction.length() > 0.0:
		velocity = velocity.move_toward(direction.normalized() * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, braking * delta)

func get_velocity() -> Vector2:
	return velocity

func _get_default_tuning() -> Dictionary:
	return {
		"max_speed": max_speed,
		"acceleration": acceleration,
		"braking": braking,
	}

func _get_tuning_config_path() -> String:
	return ""

func apply_tuning(tuning: Dictionary) -> void:
	if tuning.has("max_speed"):
		max_speed = float(tuning["max_speed"])
	if tuning.has("acceleration"):
		acceleration = float(tuning["acceleration"])
	if tuning.has("braking"):
		braking = float(tuning["braking"])

func _load_tuning_from_json(config_path: String) -> void:
	if config_path.is_empty():
		return
	if not FileAccess.file_exists(config_path):
		push_warning("Missing vehicle tuning config: %s" % config_path)
		return

	var file := FileAccess.open(config_path, FileAccess.READ)
	if file == null:
		push_warning("Could not open vehicle tuning config: %s" % config_path)
		return

	var parse_result := JSON.parse_string(file.get_as_text())
	if typeof(parse_result) != TYPE_DICTIONARY:
		push_warning("Vehicle tuning config must be a JSON object: %s" % config_path)
		return

	apply_tuning(parse_result)
