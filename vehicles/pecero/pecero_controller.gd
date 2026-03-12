extends "res://core/vehicle_controller.gd"

func _get_tuning_config_path() -> String:
	return "res://vehicles/pecero/pecero_tuning.json"

func _get_default_tuning() -> Dictionary:
	return {
		"max_speed": 18.0,
		"acceleration": 4.0,
		"braking": 8.0,
	}
