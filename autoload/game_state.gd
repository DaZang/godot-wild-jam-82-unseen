extends Node

const DEFAULT_NUMBER_OF_FIRE_BALLS := 3

var level_number := 1
var hero_health_percentage := 0.0
var combo_score_percentage := 0.0
var number_of_fire_balls := 3
var combo_damage_multiplier := 1.0 :
	set(value):
		combo_damage_multiplier = value
		GameEvents.emit_combo_damage_multiplier_changed(value)


func _ready() -> void:
	GameEvents.level_loaded.connect(_on_level_loaded)
	
	
	
func _on_level_loaded(loaded_level_number: int) -> void:
	self.level_number = loaded_level_number
	number_of_fire_balls = DEFAULT_NUMBER_OF_FIRE_BALLS
	combo_damage_multiplier = 1.0
