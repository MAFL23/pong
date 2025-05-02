extends Node2D

@onready var player_1: Player = $Player_1
@onready var player_2: Player = $Player_2
@onready var ai: Node = $Ai
@onready var ball: CharacterBody2D = $Ball
@onready var arena: Arena = $Arena
@onready var score_ui: ScoreUI = $ScoreUI
@onready var pause_menu: Control = $PauseMenu
@onready var paddle: Paddle = $Paddle
@onready var paddle_2: Paddle = $Paddle2

var paused := false
var game_just_opened := true

func _ready() -> void:
	arena.score_changed.connect(_on_arena_score_changed)
	arena.score_changed.connect(score_ui.score_changed)
	player_1.set_physics_process(false)
	player_2.set_physics_process(false)
	ai.set_physics_process(false)
	ball.direction = Vector2.ZERO
	pause_game()
	
func start_game(ai_oponent := false)->void:
	arena.reset_scores()
	score_ui.score_changed(1,0)
	score_ui.score_changed(2,0)
	paddle.global_position = Vector2(64, 256)
	paddle_2.global_position = Vector2(832, 256)
	ball.reset()
	player_1.set_physics_process(true)
	player_2.set_physics_process(!ai_oponent)
	ai.set_physics_process(ai_oponent)
	ball.start_moving()
	

func _on_arena_score_changed(_player:int, _score:int)->void:
	ball.reset()
	ball.start_moving()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and !game_just_opened:
		pause_game()

func pause_game()->void:
	paused = !paused
	pause_menu.visible = paused
	get_tree().paused = paused


func _on_pause_menu_two_players_pressed() -> void:
	game_just_opened = false
	pause_game()
	start_game()


func _on_pause_menu_vs_ai_pressed() -> void:
	game_just_opened = false
	pause_game()
	start_game(true)
