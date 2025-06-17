class_name Main
extends Node2D
@onready var pause_menu_ui: PauseMenuUi = %PauseMenuUi
@onready var fail_screen_ui: FailScreenUi = %FailScreenUi
@onready var game: Game = %Game

var current_level_number := 1


func _ready() -> void:
	pause_menu_ui.restart_level_button.pressed.connect(restart_level)
	pause_menu_ui.continue_button.pressed.connect(unpause)
	fail_screen_ui.restart_level_button.pressed.connect(restart_level)
	GameEvents.level_failed.connect(show_fail_screen)
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
	

func restart_level() -> void:
	game.load_level(game.current_level_id)
	unpause()
	
	

func unpause() -> void:
	game.get_tree().paused = false
	pause_menu_ui.hide()
	fail_screen_ui.hide()
	
	
func pause() -> void:
	game.get_tree().paused = true
	pause_menu_ui.show()
