extends Node

var main

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

signal play_button_pressed

func _on_play_button_pressed() -> void:
	play_button_pressed.emit()
	
func _on_settings_button_pressed() -> void:
	self.visible=false
	get_node("/root/Main").load_scene("res://scenes/SettingsMenu.tscn")

	
func _on_quit_button_pressed() -> void:
	get_tree().quit()
