class_name EnemySpawner
extends Node2D

@export var basic_enemy_scene: PackedScene

@onready var hero_detector_area_2d: Area2D = %HeroDetectorArea2D


func _ready():
	hero_detector_area_2d.body_entered.connect(on_body_entered)
	
	
func on_body_entered(body: Node2D):
	if body is Hero:
		spawn_enemy()
		
		
func spawn_enemy() -> void:
	var enemy = basic_enemy_scene.instantiate() as Node2D
	var entities_layer = get_tree().get_first_node_in_group("entities_node")
	entities_layer.call_deferred("add_child", enemy)
	enemy.global_position = global_position
