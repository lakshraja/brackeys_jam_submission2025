extends CharacterBody2D

const INITIAL_SPEED=1000
var speed = INITIAL_SPEED
func _ready():
	velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity=Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x=+speed
	if Input.is_action_pressed("left"):
		velocity.x=-speed
	if Input.is_action_pressed("up"):
		velocity.y=-speed
	if Input.is_action_pressed("down"):
		velocity.y=+speed

	move_and_slide()
	#position += velocity * delta
	
func _process(delta: float) -> void:
	pass
