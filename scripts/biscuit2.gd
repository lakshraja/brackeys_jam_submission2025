extends Area2D


signal biscuit_eaten

'''
func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name=="Player":
			biscuit_eaten.emit()
			
			#queue_free()
'''


func _process(delta)->void:
	var bodies=self.get_overlapping_bodies()
	if bodies:
		for body in bodies:
			if body.name=="Player":
				if Input.is_action_pressed("interact"):
					biscuit_eaten.emit()
