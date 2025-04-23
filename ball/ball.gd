class_name Ball extends CharacterBody2D

@export var SPEED := 400

var direction : Vector2

func _ready() -> void:
	start_moving()

func _physics_process(delta: float) -> void:
	velocity = SPEED * direction
	move_and_slide()
	
	if is_on_wall():
		direction = direction.bounce(get_wall_normal())

func start_moving()->void:
	direction = Vector2.ZERO
	get_tree().create_timer(2).timeout.connect(func ()->void:
		randomize_direction()
	)

func randomize_direction()->void:
	direction = Vector2.RIGHT.rotated(randf_range(-PI/6, PI/6)) * [-1,1].pick_random()
