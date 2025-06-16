extends Node

const SPAWN_RADIUS = 500
	
@export var basic_enemy_scene: PackedScene
@export var hero: Hero 

@onready var spawn_timer: Timer = $SpawnTimer


func _ready():
	spawn_timer.timeout.connect(on_timer_timeout)
	
	
func on_timer_timeout():
	var hero = get_tree().get_first_node_in_group("hero") as Hero
	if hero == null:
		return
	
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = hero.global_position + (random_direction * SPAWN_RADIUS)
	
	var enemy = basic_enemy_scene.instantiate() as Node2D
	
	var entities_layer = get_tree().get_first_node_in_group("entities_node")
	entities_layer.add_child(enemy)
	enemy.global_position = spawn_position
