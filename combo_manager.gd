class_name ComboManager
extends Node

const DEFAULT_COMBO_DURATION := 2.0

var current_combo_break_timer_wait_time: float
var current_combo_score: int
var total_combo_score: int

@onready var combo_break_timer: Timer = %ComboBreakTimer

func _ready() -> void:
	current_combo_break_timer_wait_time = DEFAULT_COMBO_DURATION
	combo_break_timer.wait_time = current_combo_break_timer_wait_time
	GameEvents.enemy_died.connect(_on_enemy_died)
	combo_break_timer.timeout.connect(_on_combo_break_timer_timeout)
	

func _physics_process(delta: float) -> void:
	if not combo_break_timer.is_stopped():
		GameEvents.emit_combo_break_timer_changed(combo_break_timer.time_left, combo_break_timer.wait_time)


func _on_enemy_died() -> void:
	if not combo_break_timer.is_stopped():
		#combo_break_timer.wait_time += 1
		pass
	combo_break_timer.start()
	
	
func _on_combo_break_timer_timeout() -> void:
	current_combo_break_timer_wait_time = DEFAULT_COMBO_DURATION
	combo_break_timer.wait_time = current_combo_break_timer_wait_time
