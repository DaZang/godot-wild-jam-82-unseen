class_name GameCamera2D
extends Camera2D

@export var hero: Hero 

var target_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acquire_target()
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 20))
	
	
func acquire_target():
	if hero != null:
		target_position = hero.global_position
