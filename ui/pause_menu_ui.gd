class_name PauseMenuUi
extends Control

@onready var game_speed_slider: HSlider = %GameSpeedSlider
@onready var restart_level_button: Button = %RestartLevelButton
@onready var continue_button: Button = %ContinueButton


func _ready() -> void:
	
	game_speed_slider.value = GameSettings.game_speed_setting


func _on_game_speed_slider_value_changed(value: float) -> void:
	GameSettings.game_speed_setting = value
	
