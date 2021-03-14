extends Control




func _on_Button_pressed():
	SfxManager.play_sound(1,0.2)
	get_tree().change_scene("res://MainMenu.tscn")
