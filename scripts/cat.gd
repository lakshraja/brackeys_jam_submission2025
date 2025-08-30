extends CharacterBody2D

signal GameOver

var cat_speed=0
func _ready() -> void:
	cat_speed=50
	velocity = Vector2.ZERO
	GameOver.connect($"/root/Main".on_game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var player_pos = get_node("../Player").position
	
	#var direction = player_pos-position
	var direction = position.direction_to(player_pos)
	
	velocity=direction*cat_speed
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		GameOver.emit()
