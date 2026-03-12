extends Node2D

@onready var city_loader := preload("res://core/city_loader.gd").new()

func _ready() -> void:
	print("CUTEE sandbox booting...")
	add_child(city_loader)
	city_loader.load_city("cdmx")
