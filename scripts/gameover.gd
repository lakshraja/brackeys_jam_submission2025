extends Node


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass



func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Main.tscn")
	#await get_tree().scene_changed
	#get_node("/root/Main")._play_button_pressed()


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Main.tscn")
	
