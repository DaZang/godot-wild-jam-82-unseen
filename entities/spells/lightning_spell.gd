extends Node2D


func _on_spell_duration_timer_timeout() -> void:
	queue_free()
