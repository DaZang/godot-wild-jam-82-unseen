class_name FireSpell
extends Node2D

enum States {CHARGING, EFFECTIVE}

var state: States

@onready var charge_duration_timer: Timer = %ChargeDurationTimer
@onready var spell_duration_timer: Timer = %SpellDurationTimer
@onready var hitbox_component: HitboxComponent = %HitboxComponent
@onready var fire_shader_color_rect: ColorRect = %FireShaderColorRect


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
	fire_shader_color_rect.show()


func _on_spell_duration_timer_timeout() -> void:
	queue_free()
