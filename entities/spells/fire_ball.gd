extends Node2D
@onready var fire_shader_color_rect: ColorRect = %FireShaderColorRect


func _ready() -> void:
	if GameState.combo_damage_multiplier >= 4:
		fire_shader_color_rect.get_material().set_shader_parameter("brighter_color", Color.html("#e3cbff"))
		fire_shader_color_rect.get_material().set_shader_parameter("middle_color", Color.html("#ff36da"))
		fire_shader_color_rect.get_material().set_shader_parameter("darker_color", Color.html("#76339d"))
	else:
		fire_shader_color_rect.get_material().set_shader_parameter("brighter_color", Color.html("#fee761"))
		fire_shader_color_rect.get_material().set_shader_parameter("middle_color", Color.html("#feae34"))
		fire_shader_color_rect.get_material().set_shader_parameter("darker_color", Color.html("#cf8254"))
