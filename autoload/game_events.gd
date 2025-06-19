extends Node

signal level_failed()
signal level_completed()
signal level_loaded(level_number: int)


func emit_level_failed():
	level_failed.emit()


func emit_level_completed():
	level_completed.emit()
	
	
func emit_level_loaded(level_number: int):
	level_loaded.emit(level_number)
	
