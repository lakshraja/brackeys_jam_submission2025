extends Node


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	if get_node("/root/Main/MainMenu"): get_node("/root/Main/MainMenu").visible=true
	#if get_node("/root/Main/MainMenu"): get_node("/root/Main/MainMenu").visible=true
	queue_free()
	
