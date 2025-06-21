class_name Game
extends Node2D

signal game_completed

var current_level_id = "1"


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("load_level_1"):
		load_level("1")
	elif event.is_action_pressed("load_level_2"):
		load_level("2")
	elif event.is_action_pressed("load_level_3"):
		load_level("3")
		

func load_level(level_id: String):
	var resource_path = "res://environments/" + "level" + level_id + ".tscn"
	var level_scene: Resource
	if not ResourceLoader.exists(resource_path):
		print("new level scene can not be loaded")
		game_completed.emit()
		return
	else:
		level_scene = load(resource_path)
	var old_level = get_tree().get_first_node_in_group("environments")
	if old_level != null:
		old_level.queue_free()
	var new_level = level_scene.instantiate()
	call_deferred("add_child", new_level)
	call_deferred("move_child", new_level, 0)
	current_level_id = level_id
	GameEvents.emit_level_loaded(current_level_id.to_int())
	
	
func restart_level():
	load_level(current_level_id)


func load_next_level():
	load_level(str(current_level_id.to_int() + 1))
	
	
func restart_game():
	load_level(str(1))
