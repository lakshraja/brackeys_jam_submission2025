extends Area2D

signal biscuit_eaten

func _ready() -> void:
	biscuit_eaten.connect($"/root/Main".main_on_biscuit_eaten)




var player_in=false
func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name=="Player":
		player_in=true
			

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name=="Player":
		player_in=false



func _process(delta)->void:
	if player_in:
		#show the button press thing
		
		if Input.is_action_pressed("interact"):	
			biscuit_eaten.emit()
			queue_free()
