extends Node2D


func _ready() -> void:
	load_scene("res://scenes/levels/MainMenu.tscn")
	get_node("MainMenu").play_button_pressed.connect(_play_button_pressed)



#this guy will load the menu first
#then it will manage all the scenes and levels and also game over window
#it should also manage the ui like the cookie counter

func _process(delta: float) -> void:
	if Input.is_action_pressed("escape"):
		
		#for now, please remove
		get_tree().quit()


func _play_button_pressed()->void:
	get_node("MainMenu").queue_free()
	load_scene("res://scenes/levels/TestScene.tscn")

func load_scene(scene: String)->void:
	var loaded_scene = load(scene)
	var scene_instance = loaded_scene.instantiate()
	add_child(scene_instance)
