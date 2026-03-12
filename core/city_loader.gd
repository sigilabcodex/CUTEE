extends Node
class_name CityLoader

func load_city(city_id: String) -> void:
	var base_path := "res://cities/%s/" % city_id
	var config_path := base_path + "city_config.json"
	var scene_path := base_path + "city_scene.tscn"

	if not FileAccess.file_exists(config_path):
		push_warning("Missing city config: %s" % config_path)
		return

	var city_scene := load(scene_path)
	if city_scene == null:
		push_warning("Missing city scene: %s" % scene_path)
		return

	var city_node := city_scene.instantiate()
	add_child(city_node)
	print("Loaded city module: %s" % city_id)
