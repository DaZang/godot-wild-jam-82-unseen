extends Node

signal level_failed()
signal level_completed()


func emit_level_failed():
	level_failed.emit()

func emit_level_completed():
	level_completed.emit()
	
