class_name Paddle extends CharacterBody2D

@onready var paddle_sprite: Sprite2D = $paddle_sprite
@export var flip_sprite := false : set = _set_flip_sprite
@export var SPEED := 250

@onready var x_position := 0.0

var direction := 0

func _ready() -> void:
	velocity = Vector2.ZERO
	x_position = global_position.x
	_set_flip_sprite(flip_sprite)

func _physics_process(delta: float) -> void:
	velocity.y = SPEED * direction
	move_and_slide()
	global_position.x = x_position

func _set_flip_sprite(new_flip_sprtite_value : bool)->void:
	flip_sprite = new_flip_sprtite_value
	if paddle_sprite != null:
		paddle_sprite.flip_h = flip_sprite
