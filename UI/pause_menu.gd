extends Control

signal two_players_pressed
signal vs_ai_pressed

@onready var _2_players_button: Button = $"2PlayersButton"
@onready var vs_ai_button: Button = $vsAIButton


func _on_players_button_pressed() -> void:
	two_players_pressed.emit()


func _on_vs_ai_button_pressed() -> void:
	vs_ai_pressed.emit()
