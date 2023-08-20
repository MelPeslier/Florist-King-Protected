extends Control

@onready var badge_scene = preload("res://menus/day/player_score_menu.tscn")
@onready var list = $LBMargin/LBScroll/LBVbox


func _ready():
	refresh_leaderboard()


func refresh_leaderboard():
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	
	for item in sw_result.scores:
		var badge = badge_scene.instantiate()
		list.add_child(badge)
		badge.set_player_score(item.player_name, item.score)
