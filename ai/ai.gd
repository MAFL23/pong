extends Node

@export var paddle:Paddle=null
@export var ball:Ball=null


#func _physics_process(delta: float) -> void:
	#paddle.direction = signf(ball.global_position.y - paddle.global_position.y)
	#


func _on_timer_timeout() -> void:
	var difference = ball.global_position.y - paddle.global_position.y
	if ball.velocity.x > 0 and  abs(difference) > 32:
		paddle.direction = signf(difference)
	else:
		paddle.direction = 0
