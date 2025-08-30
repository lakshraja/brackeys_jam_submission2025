extends Node


func _ready() -> void:
	get_node("Panel/VBoxContainer/Score").text="Score: "+str(get_node("/root/Main").biscuit_count)
	var time = get_node("/root/Main").time
	get_node("Panel/VBoxContainer/Time").text="Time: "+str("%02d" % int(time/60))+":"+str("%02d" % int(time)%60)

func _process(delta: float) -> void:
	pass



func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Main.tscn")
	#await get_tree().scene_changed
	#get_node("/root/Main")._play_button_pressed()


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/Main.tscn")
	
