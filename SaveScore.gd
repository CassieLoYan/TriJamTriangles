extends Control



func appear():
	$CanvasLayer/Panel.show()
	$CanvasLayer/Panel/VBoxContainer/Label2.text=str(ScoreManager.current_score)
	if ScoreManager.current_score > 0:
		$CanvasLayer/Panel/VBoxContainer/LineEdit.show()
		$CanvasLayer/Panel/VBoxContainer/Button.show()
	else:
		$CanvasLayer/Panel/VBoxContainer/LineEdit.hide()
		$CanvasLayer/Panel/VBoxContainer/Button.hide()


func _on_Button_pressed():
	if $CanvasLayer/Panel/VBoxContainer/LineEdit.text != "":
		$CanvasLayer/Panel.hide()
		var score_id = yield(SilentWolf.Scores.persist_score($CanvasLayer/Panel/VBoxContainer/LineEdit.text,ScoreManager.current_score), "sw_score_posted")
		get_tree().change_scene("res://Leaderboard.tscn")
		ScoreManager.increase_score(-ScoreManager.current_score)
	SfxManager.play_sound(1,0.2)

func _on_Button2_pressed():
	get_tree().change_scene("res://Map.tscn")
	$CanvasLayer/Panel.hide()
	ScoreManager.increase_score(-ScoreManager.current_score)
	SfxManager.play_sound(1,0.2)
