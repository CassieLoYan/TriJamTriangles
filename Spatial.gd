extends Spatial


export (Array,PackedScene) var effects

func create_explosion(pos):
	var new_eplosion = effects[0].instance()
	add_child(new_eplosion)
	new_eplosion.global_transform.origin=pos
	new_eplosion.get_child(0).emitting=true
