class_name Arena extends Node2D

signal score_changed(player:int, score:int)

@onready var goal_area: GoalArea = $GoalArea
@onready var goal_area_2: GoalArea = $GoalArea2
@onready var score: AudioStreamPlayer = $Score

var scores := {
	1 : 0,
	2 : 0
}

func reset_scores()->void:
	scores[1] = 0
	scores[2] = 0

func _on_goal_area_goal(player: int) -> void:
	scores[player] += 1
	score_changed.emit(player, scores[player])
	score.play()
