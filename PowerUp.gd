extends Area



func _on_Area_body_entered(body):
	body.power_up()
	queue_free()
	SfxManager.play_sound(2,0.2)
