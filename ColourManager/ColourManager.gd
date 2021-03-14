extends Control

onready var tween = $Tween

export (Array, Resource) var palettes

var colour_palettes : Dictionary

var current_colour

onready var shader : ShaderMaterial = $ColorRect.material

func _ready():
	for i in palettes:
		colour_palettes[i.palette[0]] = {
			"DARK" : Color(i.palette[1]),
			"LIGHT" : Color(i.palette[2])
		}
	current_colour=colour_palettes[palettes[0].palette[0]]
	switch_colours(current_colour,false)

func switch_colours(new_colour,interpolation)-> void:
	current_colour=new_colour#colour_palettes[new_colour]
	if interpolation:
		tween.interpolate_property(shader,"shader_param/dark_colour",shader.get_shader_param("dark_colour"),current_colour["DARK"],0.5)
		tween.interpolate_property(shader,"shader_param/light_colour",shader.get_shader_param("light_colour"),current_colour["light"],0.5)
		tween.start()
		return
	else:
		shader.set_shader_param("dark_colour",current_colour["DARK"])
		shader.set_shader_param("light_colour",current_colour["LIGHT"])
		return
