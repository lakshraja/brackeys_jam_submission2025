extends CharacterBody2D

const INITIAL_SPEED=1000
var speed = INITIAL_SPEED
func _ready():
	velocity = Vector2.ZERO
	scale.x=1
	scale.y=1

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


func update_speed(count):
	#speed = INITIAL_SPEED-count*10
	#100**(-count/10)
	#(1.01)**count
	var factor_speed=(1.05)**count
	var factor_scale = (1.01)**count
	speed = speed/factor_speed
	scale.x=scale.x*factor_scale
	scale.y=scale.y*factor_scale
