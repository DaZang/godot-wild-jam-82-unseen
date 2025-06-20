extends CharacterBody2D

const MAX_SPEED = 2500

@onready var health_component: HealthComponent = %HealthComponent


func _ready() -> void:
	health_component.died.connect(GameEvents.emit_enemy_died)


func _process(_delta):
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED * _delta
	move_and_slide()

func get_direction_to_player():
	var hero = get_tree().get_first_node_in_group("hero") as Hero
	if hero != null:
		return (hero.global_position - global_position).normalized()
	return Vector2.ZERO
