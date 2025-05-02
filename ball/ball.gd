class_name Ball extends CharacterBody2D

@export var SPEED := 400
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var direction : Vector2

func _ready() -> void:
	start_moving()

func _physics_process(delta: float) -> void:
	velocity = SPEED * direction
	move_and_slide()
	
	if is_on_wall():
		direction = direction.bounce(get_wall_normal())
		audio_stream_player.play()

func start_moving()->void:
	get_tree().create_timer(2).timeout.connect(func ()->void:
		if velocity.is_equal_approx(Vector2.ZERO):	
			randomize_direction()
	)

func randomize_direction()->void:
	direction = Vector2.RIGHT.rotated(randf_range(-PI/7, PI/7)) * [-1,1].pick_random()

func reset(global_pos :=Vector2(448, 256))->void:
	global_position = global_pos
	direction = Vector2.ZERO
