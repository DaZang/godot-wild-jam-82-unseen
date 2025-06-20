extends Node

signal level_failed()
signal level_completed()
signal level_loaded(level_number: int)
signal enemy_died()
signal combo_break_timer_changed(time_left: float, wait_time: float)


func emit_level_failed():
	level_failed.emit()


func emit_level_completed():
	level_completed.emit()
	
	
func emit_level_loaded(level_number: int):
	level_loaded.emit(level_number)
	
	
func emit_enemy_died():
	enemy_died.emit()
	
	
func emit_combo_break_timer_changed(time_left: float, wait_time: float):
	combo_break_timer_changed.emit(time_left, wait_time)
