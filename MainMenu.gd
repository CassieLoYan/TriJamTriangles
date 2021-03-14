extends Spatial




func _on_Play_pressed():
	get_tree().change_scene_to(load("res://Map.tscn"))
	SfxManager.play_sound(1,0.2)


func _on_Leaderboard_pressed():
	get_tree().change_scene_to(load("res://Leaderboard.tscn"))
	SfxManager.play_sound(1,0.2)


func _on_HowToPlay_pressed():
	get_tree().change_scene_to(load("res://HowToPlay.tscn"))
	SfxManager.play_sound(1,0.2)
