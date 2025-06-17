class_name SpellManager
extends Node2D

const LIGHTNING_SPELL_SCENE = preload("res://entities/spells/lightning_spell.tscn")

var current_lightning_spell: LightningSpell

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot_lightning"):
		var entities_node = get_tree().get_first_node_in_group("entities_node") as Node2D
		var lightning_spell = LIGHTNING_SPELL_SCENE.instantiate()
		lightning_spell.global_position = get_global_mouse_position()
		entities_node.add_child(lightning_spell)
		current_lightning_spell = lightning_spell
	if event.is_action_released("shoot_lightning"):
		if current_lightning_spell != null:
			current_lightning_spell.try_abort_charging()
