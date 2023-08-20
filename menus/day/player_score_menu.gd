extends MarginContainer


@onready var player_name_label = $HBoxContainer/PlayerContainer/PlayerNameLabel
@onready var score_label = $HBoxContainer/ScoreContainer/ScoreLabel


func set_player_score(player_name:String, score):
	player_name_label.text = player_name
	score_label.text = str(score) + str(" €")
