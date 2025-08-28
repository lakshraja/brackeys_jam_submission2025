extends Node


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_resume_button_pressed() -> void:
	get_parent().ui_pause_pressed()
	

func _on_settings_button_pressed() -> void:
	pass

func _on_quit_button_pressed() -> void:
	#not working da!
	get_tree().change_scene_to_file("res://scenes/levels/Main.tscn")
	
