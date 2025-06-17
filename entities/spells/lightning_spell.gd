class_name LightningSpell
extends Node2D

enum States {CHARGING, EFFECTIVE}

var state: States

@onready var charge_duration_timer: Timer = %ChargeDurationTimer
@onready var spell_duration_timer: Timer = %SpellDurationTimer
@onready var hitbox_component: HitboxComponent = %HitboxComponent


func _ready() -> void:
	hitbox_component.collision_shape_2d.set_disabled(true)
	state = States.CHARGING
	charge_duration_timer.start()


func try_abort_charging():
	if state == States.CHARGING:
		queue_free()


func _on_charge_duration_timer_timeout() -> void:
	state = States.EFFECTIVE
	hitbox_component.collision_shape_2d.set_disabled(false)
	spell_duration_timer.start()


func _on_spell_duration_timer_timeout() -> void:
	queue_free()
