extends Control

onready var scores_container = $PanelContainer/ScoresContainer/Scores
onready var score_label = preload("res://ScoreThing.tscn")
func _ready():
	yield(SilentWolf.Scores.get_high_scores(0),"sw_scores_received")
	print("Scores: " + str(SilentWolf.Scores.scores))
	for i in SilentWolf.Scores.scores:
		var n_s_l = score_label.instance()
		scores_container.add_child(n_s_l)
		n_s_l.text=(i["player_name"]+" : "+str(i["score"]))


func _on_Button_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
	SfxManager.play_sound(1,0.2)

func _on_Button2_pressed():
	get_tree().change_scene("res://Map.tscn")
	SfxManager.play_sound(1,0.2)
