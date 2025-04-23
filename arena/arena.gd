extends Node2D

signal score_changed(player:int, score:int)

@export var controller : Node
@onready var goal_area: GoalArea = $GoalArea
@onready var goal_area_2: GoalArea = $GoalArea2

var scores := {
	1 : 0,
	2 : 0
}

func _ready() -> void:
	if controller != null:
		score_changed.connect(controller.score_changed)

func _on_goal_area_goal(player: int) -> void:
	scores[player] += 1
	score_changed.emit(player, scores[player])
