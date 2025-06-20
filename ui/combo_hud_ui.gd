class_name ComboHudUi
extends Control

@onready var texture_progress_bar: TextureProgressBar = %TextureProgressBar


func _ready() -> void:
	GameEvents.combo_break_timer_changed.connect(_on_combo_break_timer_changed)
	
	
func _on_combo_break_timer_changed(time_left: float, wait_time: float) -> void:
	texture_progress_bar.value = time_left / wait_time * 100.0
