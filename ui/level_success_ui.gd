class_name LevelSuccessUi
extends Control

@onready var level_value_label: Label = %LevelValueLabel
@onready var remaining_health_progress_bar: ProgressBar = %RemainingHealthProgressBar
@onready var combo_score_progress_bar: ProgressBar = %ComboScoreProgressBar
@onready var restart_level_button: Button = %RestartLevelButton
@onready var continue_button: Button = %ContinueButton


func _ready() -> void:
	self.visibility_changed.connect(_on_visibility_changed)


func _on_visibility_changed() -> void:
	level_value_label.text = str(GameState.level_number)
	remaining_health_progress_bar.value = GameState.hero_health_percentage
