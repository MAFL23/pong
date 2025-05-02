extends Control

signal two_players_pressed
signal vs_ai_pressed

@onready var _2_players_button: Button = $"2PlayersButton"
@onready var vs_ai_button: Button = $vsAIButton
@onready var volume_slider: HSlider = $VolumeSlider
@onready var _bus := AudioServer.get_bus_index("Master")

func _on_players_button_pressed() -> void:
	two_players_pressed.emit()


func _on_vs_ai_button_pressed() -> void:
	vs_ai_pressed.emit()


func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear_to_db(value))
	pass # Replace with function body.
