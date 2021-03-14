extends Control

var current_score = 0
onready var score_text = $CanvasLayer/Label
func _ready():
	SilentWolf.configure({
	"api_key": "not telling you my API key lmao",
	"game_id": "nope",
	"game_version": "1.0.0",
	})
	SilentWolf.configure_scores({
	  "open_scene_on_close": "res://Map.tscn"
	})
		  

func increase_score(amount):
	current_score+=amount
	score_text.text="Score: "+str(current_score)
