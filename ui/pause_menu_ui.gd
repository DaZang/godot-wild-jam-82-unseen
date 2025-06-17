class_name PauseMenuUi
extends Control

@onready var game_speed_slider: HSlider = %GameSpeedSlider
@onready var music_slider: HSlider = %MusicSlider
@onready var sfx_slider: HSlider = %SfxSlider
@onready var restart_level_button: Button = %RestartLevelButton
@onready var continue_button: Button = %ContinueButton


func _ready() -> void:
	music_slider.value = GameSettings.music_level_setting
	sfx_slider.value = GameSettings.sfx_level_setting
	game_speed_slider.value = GameSettings.game_speed_setting


func _on_game_speed_slider_value_changed(value: float) -> void:
	GameSettings.game_speed_setting = value
	
	
func _on_music_slider_value_changed(value: float) -> void:
	GameSettings.music_level_setting = value


func _on_sfx_slider_value_changed(value: float) -> void:
	GameSettings.sfx_level_setting = value
