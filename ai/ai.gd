extends Node

@export var paddle:Paddle=null
@export var ball:Ball=null


#func _physics_process(delta: float) -> void:
	#paddle.direction = signf(ball.global_position.y - paddle.global_position.y)
	#


func _on_timer_timeout() -> void:
	var difference = ball.global_position.y - paddle.global_position.y
	if ball.velocity.x > 0 and  abs(difference) > 28:
		paddle.direction = signf(difference)
	else:
		var dif_from_center = 256.0 - paddle.global_position.y
		if abs(dif_from_center) > 40 and ball.velocity.x <= 0:
			paddle.direction = signf(dif_from_center)
		else:
			paddle.direction = 0
