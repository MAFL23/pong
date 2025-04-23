class_name Player extends Node

enum PLAYER_NUMBER {PLAYER_1, PLAYER_2}

@export var player :PLAYER_NUMBER=PLAYER_NUMBER.PLAYER_1
@export var paddle_path :NodePath

const input_map := {
	PLAYER_NUMBER.PLAYER_1 : {
		"move_up" : "p1_up",
		"move_down" : "p1_down"
	},
	PLAYER_NUMBER.PLAYER_2 : {
		"move_up" : "p2_up",
		"move_down" : "p2_down"
	}
}

var paddle : Paddle = null
var up :String
var down :String

func _ready() -> void:
	paddle = get_node(paddle_path)
	up = input_map[player]["move_up"]
	down = input_map[player]["move_down"]
	pass

func _physics_process(delta: float) -> void:
	if paddle == null:
		return
	
	paddle.direction = Input.get_axis(up, down)
	
