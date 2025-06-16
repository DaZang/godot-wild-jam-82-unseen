class_name SpellManager
extends Node2D

const LIGHTNING_SPELL_SCENE = preload("res://entities/spells/lightning_spell.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot_lightning"):
		var entities_node = get_tree().get_first_node_in_group("entities_node") as Node2D
		var lightning_spell = LIGHTNING_SPELL_SCENE.instantiate()
		lightning_spell.global_position = get_global_mouse_position()
		entities_node.add_child(lightning_spell)
		
