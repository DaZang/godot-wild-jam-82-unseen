class_name ComboHudUi
extends Control

@onready var texture_progress_bar: TextureProgressBar = %TextureProgressBar
@onready var combo_damage_multiplier_value_label: Label = %ComboDamageMultiplierValueLabel


func _ready() -> void:
	GameEvents.combo_break_timer_changed.connect(_on_combo_break_timer_changed)
	GameEvents.combo_damage_multiplier_changed.connect(_on_combo_damage_multiplier_changed)
	
	
func _on_combo_break_timer_changed(time_left: float, wait_time: float) -> void:
	texture_progress_bar.value = time_left / wait_time * 100.0


func _on_combo_damage_multiplier_changed(combo_damage_multiplier: float) -> void:
	combo_damage_multiplier_value_label.text = str(combo_damage_multiplier)
	var new_color: Color
	if combo_damage_multiplier == 1.0:
		new_color = Color.WHITE
	else:
		new_color = Color.LIME_GREEN
	combo_damage_multiplier_value_label.set("theme_override_colors/font_color", new_color)
