extends Node


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func update_track():
	get_node("Track").text = get_node("/root/Main").current_track


func _on_next_button_pressed() -> void:
	pass


func _on_prev_button_pressed() -> void:
	pass
