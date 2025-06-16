extends Node

signal level_completed()


func emit_level_completed():
	level_completed.emit()
