class_name IdleRatEnemy
extends CharacterBody2D

@onready var health_component: HealthComponent = %HealthComponent

func _ready() -> void:
	health_component.died.connect(GameEvents.emit_enemy_died)


func _process(_delta):
	move_and_slide()
