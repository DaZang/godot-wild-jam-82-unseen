class_name Hero
extends CharacterBody2D

const MAX_SPEED = 1500.0

var number_colliding_bodies = 0

@onready var health_bar: ProgressBar = %HealthBar
@onready var damage_interval_timer: Timer = %DamageIntervalTimer
@onready var hurt_area_2d: Area2D = %HurtArea2D
@onready var health_component: HealthComponent = %HealthComponent


func _ready() -> void:
	hurt_area_2d.body_entered.connect(on_body_entered)
	hurt_area_2d.body_exited.connect(on_body_exited)
	damage_interval_timer.timeout.connect(on_damage_interval_timer_timeout)
	health_component.health_changed.connect(on_health_changed)
	update_health_display()


func _physics_process(delta: float) -> void:
	velocity = Vector2(MAX_SPEED * delta, 0)
	move_and_slide()


func check_deal_damage():
	if number_colliding_bodies == 0 || !damage_interval_timer.is_stopped():
		return
	health_component.damage(1)
	damage_interval_timer.start()
	print(health_component.current_health)


func on_body_entered(other_body: Node2D):
	number_colliding_bodies += 1
	check_deal_damage()


func on_body_exited(other_body: Node2D):
	number_colliding_bodies -= 1
	
	
func on_damage_interval_timer_timeout():
	check_deal_damage()

func on_health_changed():
	update_health_display()
	

func update_health_display():
	health_bar.value = health_component.get_health_percent()
