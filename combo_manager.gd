class_name ComboManager
extends Node

const DEFAULT_COMBO_DURATION := 2.0

var current_combo_break_timer_wait_time: float
var current_combo_score: int
# var total_combo_score: int
var highest_multi_kill_in_combo := 0.0
var current_multi_kill := 0.0

@onready var combo_break_timer: Timer = %ComboBreakTimer
@onready var multi_kill_timer: Timer = %MultiKillTimer


func _ready() -> void:
	current_combo_break_timer_wait_time = DEFAULT_COMBO_DURATION
	combo_break_timer.wait_time = current_combo_break_timer_wait_time
	GameEvents.enemy_died.connect(_on_enemy_died)
	combo_break_timer.timeout.connect(_on_combo_break_timer_timeout)
	multi_kill_timer.timeout.connect(_on_multi_kill_timer_timeout)
	

func _physics_process(_delta: float) -> void:
	if not combo_break_timer.is_stopped():
		GameEvents.emit_combo_break_timer_changed(combo_break_timer.time_left, combo_break_timer.wait_time)


func _on_enemy_died() -> void:
	multi_kill_timer.start()
	current_multi_kill += 1.0
	if highest_multi_kill_in_combo < current_multi_kill:
		highest_multi_kill_in_combo = current_multi_kill
		GameState.combo_damage_multiplier = highest_multi_kill_in_combo
		GameState.number_of_fire_balls = GameState.DEFAULT_NUMBER_OF_FIRE_BALLS + highest_multi_kill_in_combo
	if not combo_break_timer.is_stopped():
		combo_break_timer.wait_time += 0.1
	combo_break_timer.start()
	
	
func _on_multi_kill_timer_timeout() -> void:
	current_multi_kill = 0.0
	
	
func _on_combo_break_timer_timeout() -> void:
	current_combo_break_timer_wait_time = DEFAULT_COMBO_DURATION
	combo_break_timer.wait_time = current_combo_break_timer_wait_time
	GameState.combo_damage_multiplier = 1.0
	current_multi_kill = 0.0
	highest_multi_kill_in_combo = 0.0
