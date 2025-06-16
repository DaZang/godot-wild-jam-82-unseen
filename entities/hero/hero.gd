class_name Hero
extends CharacterBody2D

const MAX_SPEED = 1500.0


func _physics_process(delta: float) -> void:
	velocity = Vector2(MAX_SPEED * delta, 0)
	move_and_slide()
