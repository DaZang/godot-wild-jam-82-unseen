class_name HitboxComponent
extends Area2D

@export var damage = 0

@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D

func _ready() -> void:
	damage *= GameState.combo_damage_multiplier
