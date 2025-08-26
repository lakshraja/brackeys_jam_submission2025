extends CharacterBody2D

const INITIAL_SPEED=100

func _ready():
	var speed = INITIAL_SPEED
	var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	pass
	
func _process(delta: float) -> void:
	velocity=Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x=+1000
	if Input.is_action_pressed("left"):
		velocity.x=-1000
	if Input.is_action_pressed("up"):
		velocity.y=-1000
	if Input.is_action_pressed("down"):
		velocity.y=+1000
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
