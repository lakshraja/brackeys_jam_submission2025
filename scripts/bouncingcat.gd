extends CharacterBody2D

signal GameOver

var cat_speed=0
var direction = Vector2.ZERO
func _ready() -> void:
	cat_speed=500
	var rng = RandomNumberGenerator.new()
	var point = Vector2.ZERO
	point.x=rng.randf_range(-1260, 3150)
	point.y=rng.randf_range(20, 2580)
	
	direction = position.direction_to(point)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	velocity=cat_speed*direction
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		GameOver.emit()
		get_tree().quit()
	
	if body.name=="Side_Walls":
		direction.x=direction.x*(-1)
	if body.name=="Horizontal_Walls":
		direction.y=direction.y*(-1)
