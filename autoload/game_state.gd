extends Node

var level_number := 1
var hero_health_percentage := 0.0
var combo_score_percentage := 0.0


func _ready() -> void:
	GameEvents.level_loaded.connect(_on_level_loaded)
	
	
func _on_level_loaded(loaded_level_number: int) -> void:
	self.level_number = loaded_level_number
