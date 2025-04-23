extends Control
@onready var score_player_1: Label = $ScorePlayer1
@onready var score_player_2: Label = $ScorePlayer2


func score_changed(player:int, score:int)->void:
	if player == 1:
		score_player_1.text = "{s}".format({"s" : score})
	if player == 2:
		score_player_2.text = "{s}".format({"s" : score})
