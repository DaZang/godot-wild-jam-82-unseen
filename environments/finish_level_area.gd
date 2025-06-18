class_name FinishLevelArea
extends Node2D

@onready var finish_level_area_2d: Area2D = %FinishLevelArea2D


func _ready():
	finish_level_area_2d.body_entered.connect(on_body_entered)
	
	
func on_body_entered(body: Node2D):
	if body is Hero:
		GameEvents.emit_level_completed()
