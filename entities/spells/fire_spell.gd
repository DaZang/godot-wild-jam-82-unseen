class_name FireSpell
extends Node2D

enum States {CHARGING, EFFECTIVE}

var state: States

@export var fire_ball_scene: PackedScene

@onready var charge_duration_timer: Timer = %ChargeDurationTimer
@onready var spell_duration_timer: Timer = %SpellDurationTimer
@onready var spell_start_point_sprite: Sprite2D = %SpellStartPointSprite
@onready var spell_end_point_sprite: Sprite2D = %SpellEndPointSprite
@onready var flame_audio_stream_player_2d: AudioStreamPlayer2D = %FlameAudioStreamPlayer2D
@onready var charge_audio_stream_player_2d: AudioStreamPlayer2D = %ChargeAudioStreamPlayer2D


func _ready() -> void:
	state = States.CHARGING
	charge_duration_timer.start()
	charge_audio_stream_player_2d.play()
	
	
	
func _physics_process(_delta: float) -> void:
	if state == States.CHARGING:
		spell_end_point_sprite.global_position = get_global_mouse_position()


func try_abort_charging():
	if state == States.CHARGING:
		queue_free()


func _on_charge_duration_timer_timeout() -> void:
	state = States.EFFECTIVE
	spell_duration_timer.start()
	for i in range(1, GameState.number_of_fire_balls + 1):
		var fire_ball = fire_ball_scene.instantiate() as Node2D
		fire_ball.position = spell_start_point_sprite.position + \
				(spell_end_point_sprite.position - spell_start_point_sprite.position) \
				 / (GameState.number_of_fire_balls - 1) * (i - 1)
		call_deferred("add_child", fire_ball)
	flame_audio_stream_player_2d.play()
	
	


func _on_spell_duration_timer_timeout() -> void:
	queue_free()
