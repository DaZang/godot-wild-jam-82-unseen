class_name Main
extends Node2D
@onready var pause_menu_ui: PauseMenuUi = %PauseMenuUi
@onready var game: Game = %Game


func _ready() -> void:
	#GameEvents.level_failed.connect()
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if pause_menu_ui.visible:
			game.get_tree().paused = false
			pause_menu_ui.hide()
		else:
			game.get_tree().paused = true
			pause_menu_ui.show()
