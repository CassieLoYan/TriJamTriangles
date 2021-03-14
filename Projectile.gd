extends KinematicBody


func _process(delta):
	var col = move_and_collide(global_transform.basis.z*10*delta)
	if col:
		queue_free()

func _on_Area_area_entered(area):
	Effects.create_explosion(global_transform.origin)
	area.queue_free()
	ScoreManager.increase_score(2)
	SfxManager.play_sound(0,0.25)


