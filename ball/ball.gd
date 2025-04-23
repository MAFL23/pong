class_name Ball extends CharacterBody2D

@export var SPEED := 400

var direction : Vector2

func _ready() -> void:
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _physics_process(delta: float) -> void:
	velocity = SPEED * direction
	move_and_slide()
	
	if is_on_wall():
		direction = direction.bounce(get_wall_normal())
