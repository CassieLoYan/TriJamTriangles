extends Position3D


func _on_Timer_timeout():
	if rand_range(0,100)<20 and get_child_count()<2:
		var new_powerup=load("res://PowerUp.tscn").instance()
		add_child(new_powerup)
		new_powerup.transform.origin.x+=rand_range(-18,18)
		new_powerup.transform.origin.z+=rand_range(-18,18)
