extends "res://core/vehicle_controller.gd"

func _get_tuning_config_path() -> String:
	return "res://vehicles/bicycle/bicycle_tuning.json"

func _get_default_tuning() -> Dictionary:
	return {
		"max_speed": 10.0,
		"acceleration": 5.5,
		"braking": 7.0,
	}
