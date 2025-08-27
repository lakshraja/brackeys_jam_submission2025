extends Node

func _process(delta)->void:
	pass


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	#check if player presses input, when input gotten eat
	if body.name=="Player":
		print("biscuit eaten")
		queue_free()
