extends Node2D

var current_scene

var biscuit_count=0
var time=0

var is_playing=false
var is_paused=false
signal pause_pressed

func _ready() -> void:
	biscuit_count=0
	time=0
	is_playing=false
	is_paused=false
	load_scene("res://scenes/levels/MainMenu.tscn")
	get_node("MainMenu").play_button_pressed.connect(_play_button_pressed)



#this guy will load the menu first
#then it will manage all the scenes and levels and also game over window
#it should also manage the ui like the cookie counter

func _process(delta: float) -> void:
	if not is_paused and is_playing: time+=delta
	
	if Input.is_action_pressed("escape"):
		pass
		#for now, please remove
		#get_tree().quit()

func _play_button_pressed()->void:
	get_node("MainMenu").queue_free()
	load_scene("res://scenes/UILayer.tscn")
	
	#load_scene("res://scenes/levels/TestScene.tscn")
	#current_scene = "TestScene"
	
	#load_scene("res://scenes/levels/Tutorial.tscn")
	#current_scene = "Tutorial"
	switch_scenes_without_path("EndlessGameMode")
	
	is_playing = true
	
	biscuit_count=0

	pause_pressed.connect($"/root/Main/UILayer".ui_pause_pressed)


func load_scene(scene: String)->void:
	var loaded_scene = load(scene)
	var scene_instance = loaded_scene.instantiate()
	add_child(scene_instance)


func switch_scenes(scene: String, scene_path: String)->void:
	if current_scene: 
		get_node(current_scene).queue_free()
	load_scene(scene_path)
	current_scene=scene
	
func switch_scenes_without_path(scene: String):
	if current_scene: 
		get_node(current_scene).queue_free()
	load_scene("res://scenes/levels/"+scene+".tscn")
	current_scene=scene


func main_on_biscuit_eaten():
	biscuit_count+=1
	#get_node("./TestScene/Player").update_speed(biscuit_count)
	get_node("./"+current_scene+"/Player").update_speed(biscuit_count)
	
	
func _input(event: InputEvent) -> void:
	if is_playing:
		if event.is_action_pressed("escape"):
			is_paused = not is_paused
				
			get_tree().paused=is_paused
			pause_pressed.emit()
