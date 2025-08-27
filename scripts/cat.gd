extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var player_pos = get_node("../Player").position
	
	#var direction = player_pos-position
	var direction = position.direction_to(player_pos)
	
	velocity=direction*100
	move_and_slide()
