class_name GoalArea extends Area2D

signal goal(player:int)

@export_enum("Player1:1", "Player2:2") var point_to := 1

func _on_body_entered(body: Node2D) -> void:
	goal.emit(point_to)
