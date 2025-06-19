class_name Main
extends Node2D

@onready var pause_menu_ui: PauseMenuUi = %PauseMenuUi
@onready var fail_screen_ui: FailScreenUi = %FailScreenUi
@onready var level_success_ui: LevelSuccessUi = %LevelSuccessUi
@onready var game_completed_ui: GameCompletedUi = %GameCompletedUi

@onready var game: Game = %Game

var current_level_number := 1


func _ready() -> void:
	pause_menu_ui.restart_level_button.pressed.connect(restart_level)
	pause_menu_ui.continue_button.pressed.connect(unpause)
	level_success_ui.restart_level_button.pressed.connect(restart_level)
	level_success_ui.continue_button.pressed.connect(continue_to_next_level)
	fail_screen_ui.restart_level_button.pressed.connect(restart_level)
	game.game_completed.connect(show_game_completed_ui)
	game_completed_ui.restart_game_button.pressed.connect(restart_game)
	GameEvents.level_failed.connect(show_fail_screen)
	GameEvents.level_completed.connect(_on_level_completed)
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and not fail_screen_ui.visible:
		if pause_menu_ui.visible:
			unpause()
		else:
			pause()


func show_fail_screen() -> void:
	fail_screen_ui.show()
	game.get_tree().paused = true
	
	
func _on_level_completed() -> void:
	level_success_ui.show()
	game.get_tree().paused = true
	
	
func show_game_completed_ui() -> void:
	game_completed_ui.show()
	game.get_tree().paused = true


func restart_level() -> void:
	game.restart_level()
	unpause()
	
	
func continue_to_next_level() -> void:
	unpause()
	game.load_next_level()
	
func restart_game() -> void:
	game.restart_game()
	unpause()
	

func unpause() -> void:
	game.get_tree().paused = false
	pause_menu_ui.hide()
	fail_screen_ui.hide()
	level_success_ui.hide()
	game_completed_ui.hide()
	
	
func pause() -> void:
	game.get_tree().paused = true
	pause_menu_ui.show()
