class_name Main
extends Node2D
@onready var pause_menu_ui: PauseMenuUi = %PauseMenuUi
@onready var game: Game = %Game

var current_level_number := 1


func _ready() -> void:
	pause_menu_ui.restart_level_button.pressed.connect(restart_level)
	pause_menu_ui.continue_button.pressed.connect(unpause)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if pause_menu_ui.visible:
			unpause()
		else:
			pause()


func restart_level() -> void:
	game.load_level(game.current_level_id)
	unpause()
	
	
	
func unpause() -> void:
	game.get_tree().paused = false
	pause_menu_ui.hide()
	
	
func pause() -> void:
	game.get_tree().paused = true
	pause_menu_ui.show()
